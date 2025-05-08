import 'package:flutter/material.dart';

class IframeWidget extends StatelessWidget {
  final String url;
  const IframeWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Iframe not supported on this platform."));
  }
}
