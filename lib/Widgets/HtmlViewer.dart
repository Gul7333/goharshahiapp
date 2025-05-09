import 'package:flutter/material.dart';
import 'package:gohar_shahi/Helper/lauchUrl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart'; // For checking platform


class Inappwebview extends StatelessWidget {
  final String url ;
  const Inappwebview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
           body: kIsWeb
            ? Center(
                child: ElevatedButton(
                  onPressed: () {
                    openLinK(url); // Open in browser for web
                  },
                  child: Text('Open Linktree in Browser'),
                ),
              )
            : SimpleWebView(url: url)
              
      ),
    );
  }
}




class SimpleWebView extends StatefulWidget {
  final String url;

  const SimpleWebView({super.key, required this.url});

  @override
  State<SimpleWebView> createState() => _SimpleWebViewState();
}

class _SimpleWebViewState extends State<SimpleWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return 
    WebViewWidget(controller: _controller);
  
  }
}
