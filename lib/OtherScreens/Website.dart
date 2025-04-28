import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InappWebsite extends StatefulWidget {
  final String url;
  const InappWebsite({super.key,required this.url});

  @override
  State<InappWebsite> createState() => _InappWebsiteState();
}

class _InappWebsiteState extends State<InappWebsite> {

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
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(

  children: [
    ListTile(
      title: Text("Official web"),
      onTap: ()=>_openLink("https://goharshahi.com"),
      
    )
  ],
),
    );
  }
}
