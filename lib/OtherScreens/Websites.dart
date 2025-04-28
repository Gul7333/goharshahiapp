import 'package:flutter/material.dart';
import 'package:gohar_shahi/Widgets/wesbitesList.dart';

class WebsiteScreen extends StatelessWidget {
  const WebsiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> websites = {
      "Gohar Shahi Website": "https://goharshahi.com",
      "Younus AlGohar Website": 'https://www.younusalgohar.com',
      "Younus AlGohar Facebook": 'https://www.facebook.com/riazul.jannah',
      "Younus AlGohar twitter (X)": 'https://x.com/younusalgohar',
      "Alra Tv twitter": "https://x.com/AlRa_TV",
      "Alra Tv YouTube": "https://youtube.com/alratv",
      "Messiah Foundation Facebook":
          "https://www.facebook.com/MessiahFoundation",
      "Messiah Foundation Twitter": 'https://twitter.com/MessiahFdn',
      "Whatsapp": "https://wa.me/+447472540642",
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Official Websites")),
      body: WebsiteList(websites: websites),
    );
  }
}
