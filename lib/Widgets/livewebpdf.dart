// import 'package:flutter/material.dart';
// import 'package:web/web.dart';
// import 'package:html/dom.dart';
// import 'package:html/dom_parsing.dart';
// import 'package:html/html_escape.dart';
// import 'package:html/parser.dart';


// class IframeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Create an iframe using dart:html
//     final iframe = document.querySelector("iframe")
//       ..width = '800'
//       ..height = '600'
//       ..src = 'https://flutter.dev'
//       ..style.border = 'none';

//     // Append to the DOM
   
//     html.document.body?.append(iframe);

//     // Return an empty container (since DOM is modified directly)
//     return SizedBox.shrink();
//   }
// }