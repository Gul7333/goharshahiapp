import 'package:flutter/material.dart';
import 'package:gohar_shahi/Helper/DownloadandSave.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class Livepdfrx extends StatefulWidget {
  final String url;
  final String name;
  const Livepdfrx({super.key, required this.url, required this.name});

  @override
  State<Livepdfrx> createState() => _LivepdfrxState();
}

class _LivepdfrxState extends State<Livepdfrx> {
  final PdfViewerController _controler = PdfViewerController();

  double progress = 0.0;
  int? totalSize;
  bool isLoading = true;
  String? localPDFPath;
  PDFResult? resultPdf;

  @override
  void initState() {
    super.initState();
    fetchAndStorePDF();
  }

  void progessUpdate(int received, int total) {
    totalSize = total;
    if (total != -1) {
      setState(() {
        progress = received / total;
      });
    }
  }

  Future<void> fetchAndStorePDF() async {
    try {
      final resultPd = await PDFManager.downloadPDF(
        url: widget.url,
        fileName: widget.name,
        onProgress: progessUpdate,
      );
      if (resultPd != null) {
        if (mounted) {
          setState(() {
            // localPDFPath = path;
            resultPdf = resultPd;
            isLoading = false;
          });
        }
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child:
            isLoading
                ? Center(
                  child: CircularPercentIndicator(
                    percent: progress,
                    radius: 25,
                    center: Text('${(progress * 100).toStringAsFixed(0)}%'),
                    footer: Text(
                      "${widget.name} is being fetched from internet,\nplz make sure you have working internet",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: 12),
                    ),
                    header:
                        totalSize != null
                            ? Text(
                              "Total size of book ${(totalSize! / 1000000).toStringAsFixed(0)} Mb",
                            )
                            : null,
                  ),
                )
                : uripdf()
      ),
    );
  }

  PdfViewer uripdf() {
    return PdfViewer.uri(
      Uri.parse(widget.url),
      controller: _controler,
      params: PdfViewerParams(
        loadingBannerBuilder:
            (context, bytesDownloaded, totalBytes) =>
                Center(child: CircularProgressIndicator()),
        viewerOverlayBuilder:
            (context, size, handleLinkTap) => [
              PdfViewerScrollThumb(
                controller: _controler,
                orientation: ScrollbarOrientation.right,
                thumbSize: const Size(40, 25),
                thumbBuilder:
                    (context, thumbSize, pageNumber, controller) => Container(
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          pageNumber.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              ),
              PdfViewerScrollThumb(
                controller: _controler,
                orientation: ScrollbarOrientation.bottom,
                thumbSize: const Size(45, 25),
                thumbBuilder:
                    (context, thumbSize, pageNumber, controller) =>
                        Container(color: const Color.fromARGB(255, 39, 38, 37)),
              ),
            ],
      ),
    );
  }
}

