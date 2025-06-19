import 'package:flutter/material.dart';
import 'package:gohar_shahi/Helper/lauchUrl.dart';
import 'package:gohar_shahi/Helper/shared_prefs_helper.dart';
import 'package:pdfrx/pdfrx.dart';

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
  int _initialPage = 0;
  // String get _prefsKey => 'lastPage_${widget.bookTitle}';

  @override
  void initState() {
    super.initState();
    _loadLastPage();
    _controller.addListener(_saveCurrentPage);
  }

 Future<void> _loadLastPage() async {
  final page = await SharedPrefsHelper.getInt('lastPage_${widget.bookTitle}') ?? 0;
  setState(() {
    _initialPage = page;
  });
}
 void _saveCurrentPage() {
  SharedPrefsHelper.setInt('lastPage_${widget.bookTitle}', _controller.pageNumber ?? _initialPage);
}
  @override
  void dispose() {
    _controller.removeListener(_saveCurrentPage);
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
              openLinK("https://gohar-shahi.com/books");
            },
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: PdfViewer.asset(
        controller: _controller,
        initialPageNumber: _initialPage,
        widget.bookUrl,
        params: PdfViewerParams(
          loadingBannerBuilder: (context, _, __) =>
              const Center(child: CircularProgressIndicator()),
          scaleEnabled: true,
          enableTextSelection: true,
          enableKeyboardNavigation: true,
          scrollByArrowKey: 100,
          verticalCacheExtent: 1,
          scrollByMouseWheel: 5,
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
      ),
    );
  }
}
