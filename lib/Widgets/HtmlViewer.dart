import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart'; // For checking platform


class LinktreeViewer extends StatefulWidget {
  const LinktreeViewer({super.key});

  @override
  _LinktreeViewerState createState() => _LinktreeViewerState();
}

class _LinktreeViewerState extends State<LinktreeViewer> {

 

  // Function to launch the URL in the browser for web
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linktree Viewer"),
      ),
      body: kIsWeb
          ? Center(
              child: ElevatedButton(
                onPressed: () {
                  _launchURL('https://linktr.ee/alratv'); // Open in browser for web
                },
                child: Text('Open Linktree in Browser'),
              ),
            )
          : SimpleWebView(url: "https://linktr.ee/alratv")
            
           
    );
  }
}



















class SimpleWebView extends StatefulWidget {
  final String url;

  const SimpleWebView({Key? key, required this.url}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(title: const Text('WebView')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
