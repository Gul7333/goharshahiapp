import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gohar_shahi/Helper/cachedHttp.dart';
import 'package:gohar_shahi/Helper/lauchUrl.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:your_app/utils/cached_http.dart'; // replace with actual path

Future<void> checkForMessage(BuildContext context) async {
  try {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = info.version;
    debugPrint('Current version: $currentVersion');

    // Fetch version info with 3-day cache
    final jsonData = await cachedHttp<String>(
      url: 'https://docs.google.com/document/d/1qCzaTc7LkkkDl-nqMVVrzUDISJWr3aEvlu-qaHLGGs0/export?format=md',
      cacheKey: 'app_new_message',
      cacheExpiry: Duration(days: 1),
      parser: (md) => md["__raw__"],
    );

    
    if (jsonData.isNotEmpty) {
      _showMessageModal(context, jsonData);
    }
  } catch (e) {
    debugPrint('Error checking for update: $e');
  }
}

void _showMessageModal(BuildContext context, String newMessage) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text("New Message for you"),
      content: SizedBox(
        // Limit dialog height
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please read Carefully.\n",
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Markdown(
                onTapLink: (text, href, title) => openLinK(href ?? ""),
                data: newMessage,
                physics: const BouncingScrollPhysics(), // optional
              ),
            ),
          ],
        ),
      ),
      actions: [
      
        TextButton(
          onPressed: () {
                        Navigator.pop(context);

          },
          child: const Text("ok thanks"),
        ),
      ],
    ),
  );
}
