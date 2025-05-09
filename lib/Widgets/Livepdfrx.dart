import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class Livepdfrx extends StatefulWidget {
  final String url ;
  const Livepdfrx({super.key, required this.url});

  @override
  State<Livepdfrx> createState() => _LivepdfrxState();
}

class _LivepdfrxState extends State<Livepdfrx> {
   final PdfViewerController _controler = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfViewer.uri(Uri.parse(widget.url),controller: _controler,
     params: PdfViewerParams(
      loadingBannerBuilder: (context, bytesDownloaded, totalBytes) => Center(child: CircularProgressIndicator(),),
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
                      (context, thumbSize, pageNumber, controller) => Container(
                        color: const Color.fromARGB(255, 39, 38, 37),
                      ),
                ),
              ],
  
     ),
      ),
    );
  }
}