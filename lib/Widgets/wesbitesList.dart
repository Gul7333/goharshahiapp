import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  IconData _getSocialIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains("facebook")) return FontAwesomeIcons.facebook;
    if (lower.contains("youtube")) return FontAwesomeIcons.youtube;
    if (lower.contains("twitter")) return FontAwesomeIcons.twitter;
    if (lower.contains("instagram")) return FontAwesomeIcons.instagram;
    if (lower.contains("linkedin")) return FontAwesomeIcons.linkedin;
    if (lower.contains("github")) return FontAwesomeIcons.github;
    if (lower.contains("telegram")) return FontAwesomeIcons.telegram;
    if (lower.contains("reddit")) return FontAwesomeIcons.reddit;
    if (lower.contains("whatsapp")) return FontAwesomeIcons.whatsapp;
    if (lower.contains("tiktok")) return FontAwesomeIcons.tiktok;
    return FontAwesomeIcons.globe;
  }

  Color _getIconColor(String name, BuildContext context) {
    final lower = name.toLowerCase();
    if (lower.contains("facebook")) return const Color(0xFF1877F2);
    if (lower.contains("youtube")) return const Color(0xFFFF0000);
    if (lower.contains("twitter")) return const Color(0xFF1DA1F2);
    if (lower.contains("instagram")) return const Color(0xFFC13584);
    if (lower.contains("linkedin")) return const Color(0xFF0A66C2);
    if (lower.contains("github")) return Theme.of(context).colorScheme.onSurface;
    if (lower.contains("telegram")) return const Color(0xFF0088CC);
    if (lower.contains("reddit")) return const Color(0xFFFF4500);
    if (lower.contains("whatsapp")) return const Color(0xFF25D366);
    if (lower.contains("tiktok")) return const Color(0xFF000000);
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final entries = websites.entries.toList();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
    
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: entries.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final name = entries[index].key;
            final url = entries[index].value;
            final icon = _getSocialIcon(name);
            final iconColor = _getIconColor(name, context);

            return InkWell(
              onTap: () => _launchURL(url),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: iconColor.withOpacity(0.1),
                      child: FaIcon(icon, color: iconColor, size: 28),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,

                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
