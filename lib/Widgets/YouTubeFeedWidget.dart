import 'package:flutter/material.dart';
import 'package:gohar_shahi/Helper/lauchUrl.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:rss_dart/dart_rss.dart';

class YouTubeFeedWidget extends StatefulWidget {
  final String channelId;

  const YouTubeFeedWidget({super.key, required this.channelId});

  @override
  State<YouTubeFeedWidget> createState() => _YouTubeFeedWidgetState();
}

class _YouTubeFeedWidgetState extends State<YouTubeFeedWidget> {
  List<AtomItem> _videos = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadFeed();
  }

  Future<void> _loadFeed() async {
    try {
      final url =
          'https://www.youtube.com/feeds/videos.xml?channel_id=${widget.channelId}';
      final response = await http.get(Uri.parse(url));

      final feed = AtomFeed.parse(response.body);
      setState(() {
        _videos = feed.items;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load feed: $e';
        _loading = false;
      });
    }
  }

  Future<void> _openVideo(String link) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  String? _extractVideoId(String? fullId) {
    if (fullId == null) return null;
    final parts = fullId.split(':');
    return parts.isNotEmpty ? parts.last : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latest Alra Tv Videos"),),
      body: _error != null ? Text("error occured") :
          _loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _videos.length,
                itemBuilder: (context, index) {
                  final video = _videos[index];

                  final videoId = _extractVideoId(video.id);
                  final thumbnail =
                      video.media?.thumbnails.isNotEmpty == true
                          ? video.media?.thumbnails.first.url
                          : (videoId != null
                              ? 'https://img.youtube.com/vi/$videoId/0.jpg'
                              : null);
                  final title =
                      video.media?.title?.type ?? video.title ?? 'No title';
                  final description = video.media?.description ?? '';
                  final published = 
              
                      video.published?.toString().split('.')[0] ?? '';
                  final link =
                      video.links.isNotEmpty ? video.links.first.href : null;

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: ListTile(
                      leading:
                          thumbnail != null
                              ? Image.network(
                                thumbnail,
                                width: 100,
                                
                                fit: BoxFit.cover,
                              )
                              : null,
                      title: Text(
                        title.toString(),
                        style: TextStyle(height: 1.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(formatIsoDate(published)),
                      onTap: () {
                        if (link != null) {
                          openLinK(link);
                        }
                      },
                    ),
                  );
                },
              ),
    );
  }
}

String formatIsoDate(String? isoDateString) {
  if (isoDateString == null || isoDateString.isEmpty) return '';
  final date = DateTime.tryParse(isoDateString);
  if (date == null) return '';

  final months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final day = date.day;
  final month = months[date.month - 1];
  final year = date.year;

  return '$day $month, $year'; // e.g., 21 June, 2025
}