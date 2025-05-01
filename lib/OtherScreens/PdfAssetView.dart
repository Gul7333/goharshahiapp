import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadBookScreen extends StatefulWidget {
  final String bookUrl;
  final String bookTitle;
  const ReadBookScreen({
    super.key,
    required this.bookUrl,
    required this.bookTitle,
  });

  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  final PdfViewerController _controller = PdfViewerController();
  double progress = 0;

  // final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    //      pdfController = PdfController(
    //   document: PdfDocument.openAsset(widget.bookUrl),
    //   viewportFraction: 0.6,

    // );
  }

  // Function to open the URL
  Future<void> _openLink(String url) async {
    Uri uri = Uri.parse(url);
    // Check if the URL can be launched
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

   @override
    void dispose() {
      
      super.dispose();
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.bookTitle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _openLink("https://gohar-shahi.com/books.html");
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      // body: SfPdfViewer.asset(widget.bookUrl,controller: _controller,key: _pdfViewerKey,)
      body: PdfViewer.asset(
        controller: _controller,
        widget.bookUrl,
        params: PdfViewerParams(
          loadingBannerBuilder: (context, bytesDownloaded, totalBytes) {
if(totalBytes != null){

                 progress = bytesDownloaded / totalBytes ;
                 setState(() {
                   
                 });
}

            return  Center(
                  child: CircularPercentIndicator(
                    percent: progress,
                    radius: 25,
                    center: Text('${(progress * 100).toStringAsFixed(0)}%'),
                    footer: Text(
                      "${widget.bookTitle} loading",
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: 12),
                    ),
                  
                ));
          },

          scaleEnabled: true,
          enableTextSelection: true,
          enableKeyboardNavigation: true,
          scrollByArrowKey: 100,
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
                          Container(color: const Color.fromARGB(255, 39, 38, 37)),
                ),
              ],
        ),
      ),
    );
  }
}
