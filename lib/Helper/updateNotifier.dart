import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gohar_shahi/Helper/cachedHttp.dart';
import 'package:gohar_shahi/Helper/lauchUrl.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:your_app/utils/cached_http.dart'; // replace with actual path


Future<void> checkForUpdate(BuildContext context) async {
  try {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = info.version;
    debugPrint('Current version: $currentVersion');

    // Fetch version info with 3-day cache
    final jsonData = await cachedHttp<Map<String, dynamic>>(
      url: 'https://raw.githubusercontent.com/Gul7333/gul7333/refs/heads/main/goharshahiapp.json',
      cacheKey: 'app_update_info',
      cacheExpiry: Duration(days: 2),
      parser: (json) => Map<String, dynamic>.from(json),
    );

    final latestVersion = jsonData['version'];
    String description = jsonData['description'];
    if (_isNewerVersion(latestVersion, currentVersion, )) {
      _showUpdateModal(context, latestVersion, description);
    }
  } catch (e) {
    debugPrint('Error checking for update: $e');
  }
}

bool _isNewerVersion(String latest, String current) {
  final latestParts = latest.split('.').map(int.parse).toList();
  final currentParts = current.split('.').map(int.parse).toList();

  for (int i = 0; i < latestParts.length; i++) {
    if (i >= currentParts.length || latestParts[i] > currentParts[i]) {
      return true;
    } else if (latestParts[i] < currentParts[i]) {
      return false;
    }
  }
  return false;
}


void _showUpdateModal(BuildContext context, String latestVersion, String newFeatures) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      title: const Text("Update Available"),
      content: SizedBox(
        // Limit dialog height
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A new version ($latestVersion) is available. Please update to continue.\n",
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Markdown(
                data: newFeatures,
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
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            openLinK("https://goharshahi.apk.com");
          },
          child: const Text("Update"),
        ),
      ],
    ),
  );
}
