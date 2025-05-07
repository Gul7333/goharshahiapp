import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gohar_shahi/Helper/DownloadandSave.dart';
import 'package:gohar_shahi/Widgets/iframe.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class OpenPdf extends StatefulWidget {
  final String name;
  final String pdfUrl;

  const OpenPdf({super.key, required this.name, required this.pdfUrl});

  @override
  State<OpenPdf> createState() => _OpenPdfState();
}

class _OpenPdfState extends State<OpenPdf> {
  //  String pdfUrl = "https://drive.google.com/uc?export=download&id=1m5a6DbUFZbzG1Dl3WCexutN_UuiaViQk"; // Replace with actual URL
  // String fileName = "sample5.pdf";
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
        url: widget.pdfUrl,
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
      appBar: AppBar(title: Text(widget.name)),
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
                : Pdffullview(
                  localPDFPath: localPDFPath,
                  name: widget.name,
                  pdf: resultPdf!,
                ),
      ),
    );
  }
}

class Pdffullview extends StatefulWidget {
  final String name;
  final String? localPDFPath;
  final PDFResult pdf;
  const Pdffullview({
    super.key,
    required this.localPDFPath,
    required this.name,
    required this.pdf,
  });

  @override
  State<Pdffullview> createState() => _PdffullviewState();
}
String getDrivePreviewUrl(String originalUrl) {
  String? fileId;

  // Match /file/d/FILE_ID
  final match1 = RegExp(r'/file/d/([^/]+)').firstMatch(originalUrl);
  if (match1 != null) {
    fileId = match1.group(1);
  }

  // Match id=FILE_ID
  if (fileId == null) {
    final uri = Uri.tryParse(originalUrl);
    if (uri != null) {
      fileId = uri.queryParameters['id'];
    }
  }

  if (fileId == null) {
    throw ArgumentError('Could not extract file ID from the URL');
  }

  return 'https://drive.google.com/file/d/$fileId/preview';
}



class _PdffullviewState extends State<Pdffullview> {
  final PdfViewerController _controller = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    // return IframeWidget(
    //   url: "https://drive.google.com/file/d/1lg8EXNwx6i8dh43w4Iq-6C7ElAVh6UbK/preview"
    // );

    return kIsWeb
        ? IframeWidget(url: getDrivePreviewUrl(widget.pdf.path!))
        : PdfViewer.file((widget.pdf.path!),
        controller: _controller, // <-- Add this line
        params: PdfViewerParams(
          errorBannerBuilder: (context, error, stackTrace, documentRef) => Center(child: Text(error.toString()),),

          scaleEnabled: true,
          enableTextSelection: true,
          enableKeyboardNavigation: true,
          scrollByArrowKey: 50,
          verticalCacheExtent: 1,
          scrollByMouseWheel: 5,
          viewerOverlayBuilder:
              (context, size, handleLinkTap) => [
                // Add vertical scroll thumb on viewer's right side
                PdfViewerScrollThumb(
                  controller: _controller,
                  orientation: ScrollbarOrientation.right,
                  thumbSize: const Size(40, 25),
                  thumbBuilder:
                      (context, thumbSize, pageNumber, controller) => Container(
                        color: Colors.black,
                        // Show page number on the thumb
                        child: Center(
                          child: Text(
                            pageNumber.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                ),
                // Add horizontal scroll thumb on viewer's bottom
                PdfViewerScrollThumb(
                  controller: _controller,
                  orientation: ScrollbarOrientation.bottom,
                  thumbSize: const Size(45, 25),
                  thumbBuilder:
                      (context, thumbSize, pageNumber, controller) =>
                          Container(color: Colors.black38),
                ),
              ],
        ),

        );
  }
}
