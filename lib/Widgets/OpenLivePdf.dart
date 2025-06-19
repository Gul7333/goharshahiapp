import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gohar_shahi/Helper/DownloadandSave.dart';
import 'package:gohar_shahi/Helper/shared_prefs_helper.dart';
// import 'package:gohar_shahi/Widgets/Livepdfrx.dart';
import 'package:gohar_shahi/Widgets/iframe_stub.dart';

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
  int _initialPage = 0;
  final PdfViewerController _controller = PdfViewerController();

  Future<void> _loadLastPage() async {
    if (!mounted) return;

    final page = await SharedPrefsHelper.getInt('lastPage_${widget.name}') ?? 0;

    setState(() {
      _initialPage = page;
    });
  }

  void _saveCurrentPage() {
    if (!mounted) return;

    final page = _controller.pageNumber ?? _initialPage;
    SharedPrefsHelper.setInt('lastPage_${widget.name}', page);
  }

  @override
  void initState() {
    super.initState();
    _loadLastPage();
    _controller.addListener(_saveCurrentPage);
  }

  @override
  Widget build(BuildContext context) {
    // return IframeWidget(
    //   url: "https://drive.google.com/file/d/1lg8EXNwx6i8dh43w4Iq-6C7ElAVh6UbK/preview"
    // );
    if (kIsWeb) {
      // it make url of drive to preview url
      return IframeWidget(url: getDrivePreviewUrl(widget.pdf.path!));

      // return Livepdfrx(url: widget.pdf.path!);
    }
    return Filepdf(filepath: widget.pdf.path!, name: widget.name);
  }
}

class Filepdf extends StatefulWidget {
  final String filepath;
  final String name;
  const Filepdf({super.key, required this.filepath, required this.name});

  @override
  State<Filepdf> createState() => _FilepdfState();
}

class _FilepdfState extends State<Filepdf> {
  int _initialPage = 0;
  final PdfViewerController _controller = PdfViewerController();
  Future<void> _loadLastPage() async {
    if (!mounted) return;
    final page = await SharedPrefsHelper.getInt('lastPage_${widget.name}') ?? 0;
    setState(() {
      _initialPage = page;
    });
  }

  void _saveCurrentPage() {
    if (!mounted) return;

    final page = _controller.pageNumber ?? _initialPage;
    SharedPrefsHelper.setInt('lastPage_${widget.name}', page);
  }

  @override
  void initState() {
    super.initState();
    _loadLastPage();
    _controller.addListener(_saveCurrentPage);
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewer.file(
      initialPageNumber: _initialPage,

      widget.filepath,
controller: _controller,
      params: PdfViewerParams(
      viewerOverlayBuilder: (context, size, handleLinkTap) => [
            PdfViewerScrollThumb(
              controller: _controller,
              orientation: ScrollbarOrientation.right,
              thumbSize: const Size(40, 25),
              thumbBuilder: (context, thumbSize, pageNumber, controller) =>
                  Container(
                color: Colors.redAccent,
                child: Center(
                  child: Text(
                    pageNumber.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          
          ],
      ),
    );
  }
}
