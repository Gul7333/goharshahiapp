import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteList extends StatelessWidget {
  final Map<String, String> websites;

  const WebsiteList({super.key, required this.websites});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.teal,
      Colors.blue,
      Colors.deepPurple,
      Colors.orange,
      Colors.green,
      Colors.pink,
      Colors.redAccent,
    ];

    final List<MapEntry<String, String>> entries = websites.entries.toList();

    return ListView.builder(
      itemCount: entries.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final entry = entries[index];
        final name = entry.key;
        final url = entry.value;
        final color = colors[index % colors.length];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _launchURL(url),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.6),
                    color.withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.link, color: color),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(Icons.open_in_new, color: Colors.white),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
