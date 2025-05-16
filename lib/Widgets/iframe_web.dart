import 'dart:ui_web' as ui_web;
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;
import 'package:flutter/widgets.dart';

class IframeWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const IframeWidget({
    super.key,
    required this.url,
    this.width = 800,
    this.height = 800,
  });

  @override
  Widget build(BuildContext context) {
    final viewType = 'iframe-${url.hashCode}';

    // Register a view factory for the given URL only once
    // (This is safe because Flutter web caches view factories by viewType)
    kIsWeb && ui_web.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        final iframe = web.HTMLIFrameElement()
          ..src = url
          ..style.border = 'none'
          ..width = '${width.toInt()}'
          ..height = '${height.toInt()}';
        return iframe;
      },
    );

    return  SizedBox(
      width: width,
      height: height,
   child: kIsWeb ? HtmlElementView(viewType: viewType) : null,
    ); 
  }
}
