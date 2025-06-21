import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gohar_shahi/RouteAnimation/FadeAnimations.dart';
import 'package:video_player/video_player.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery")),
      body: CustomScrollView(
        slivers: [
          _buildSectionHeader("Moon Images"),
          _buildImageGrid(context, moon, isMoon: true),
          _buildSectionHeader("Sarkar Pictures"),
          _buildImageGrid(context, arro, isMoon: false),
          _buildSectionHeader("Videos"),
          _buildVideoGrid(context, moonVideo, isMoon: true),
        ],
      ),
    );
  }

  // Section Header Widget
  SliverToBoxAdapter _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SliverGrid _buildImageGrid(
    BuildContext context,
    List<String> images, {
    required bool isMoon,
  }) {
    final assetPath = isMoon ? "assets/proofs/" : "assets/SarkarPicture/";

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, idx) {
        return InkWell(
          onTap: () {
            final allImages = images;
            Navigator.of(context).push(
              createDropFadeRoute(
                FullImageView(ind: idx, images: allImages, isMoon: isMoon),
              ),
            );
          },
          child: Image.asset(
            "$assetPath${images[idx]}",
            fit: BoxFit.cover,
            cacheWidth: (MediaQuery.of(context).size.width / 2).toInt(),
          ),
        );
      }, childCount: images.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
    );
  }

  SliverGrid _buildVideoGrid(
    BuildContext context,
    List<String> videos, {
    required bool isMoon,
  }) {
    final assetPath = isMoon ? "assets/proofs/" : "assets/SarkarPicture/";

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, idx) {
        final videoAsset = "$assetPath${videos[idx]}";
        final controller = VideoPlayerController.asset(videoAsset);

        return FutureBuilder(
          future: controller.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    createDropFadeRoute(
                      VideoPlayerScreen(videoUrl: videoAsset),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.play_circle_fill, size: 48),
                    AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: Center(child: Text(videos[idx])),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      }, childCount: videos.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 is too tight for videos
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
    );
  }
}

class FullImageView extends StatefulWidget {
  final int ind;
  final List<String> images;
  final bool isMoon;

  const FullImageView({
    super.key,
    required this.ind,
    required this.images,
    required this.isMoon,
  });

  @override
  State<FullImageView> createState() => _FullImageViewState();
}

class _FullImageViewState extends State<FullImageView> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.ind;
    _controller = PageController(initialPage: widget.ind);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _saveImage() async {
    // final status = await Gal.hasAccess();
    // if (!status) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text("Storage permission denied")),
    //   );
    //   return;
    // }
    try {
      final assetPath =
          widget.isMoon ? "assets/proofs/" : "assets/SarkarPicture/";
      final imageName = widget.images[_currentIndex];
      final byteData = await rootBundle.load("$assetPath$imageName");

      // Get Pictures directory (Gallery folder)
      final directory = Directory(
        "/storage/emulated/0/Pictures/Gohar Shahi App",
      );
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final filePath = "${directory.path}/$imageName";
      final file = File(filePath);

      await file.writeAsBytes(byteData.buffer.asUint8List());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Saved to Gallery: Pictures/Gohar Shahi App")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Not supported on Phone")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final assetPath =
        widget.isMoon ? "assets/proofs/" : "assets/SarkarPicture/";

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        pageSnapping: true,
        itemCount: widget.images.length,
        onPageChanged: (idx) {
          setState(() {
            _currentIndex = idx;
          });
        },
        itemBuilder: (context, idx) {
          return Image.asset(
            "$assetPath${widget.images[idx]}",
            fit: BoxFit.contain,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: _saveImage,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.save),
      ),
    );
  }
}

//  video player

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset(widget.videoUrl)
          ..setLooping(true)
          ..initialize().then((_) {
            _controller.play();
            setState(() {}); // Refresh UI after initialization
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          _controller.value.isInitialized
              ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
              : CircularProgressIndicator(),
    );
  }
}

List<String> moonVideo = ["1.mp4", "2.mp4", "3.mp4", "4.mp4"];

List<String> moon = [
  "divine-signs-maha-shiv-ling.png",
  "Hajre Aswad.jpeg",
  "mahashivling-kalkiavatar.png",
  "sun-kalkiavatar.png",
  "shivling-kalkiavatar.png",
  "Gohar Shahi image on moon 1.jpg",
  "Gohar Shahi image on moon 2.jpg",
  "Gohar Shahi image on moon 3.jpg",
  "Gohar Shahi image on moon 4.jpg",
  "Gohar Shahi image on moon 5.jpg",
  "Gohar Shahi image on moon 6.jpg",
  "Gohar Shahi image on moon 7.jpg",
  "Gohar Shahi image on moon 8.jpg",
  "Gohar Shahi image on moon 9.jpg",
  "Gohar Shahi image on moon 10.jpg",
  "Gohar Shahi image on moon 11.jpg",
  "Gohar Shahi image on moon 12.jpg",
  "Gohar Shahi image on moon 13.jpg",
  "Gohar Shahi image on moon 14.jpg",
  "Gohar Shahi image on moon 15.jpg",
  "Gohar Shahi image on moon 16.jpg",
  "Gohar Shahi image on moon 17.jpg",
  "Gohar Shahi image on moon 18.jpg",
  "Gohar Shahi image on moon 19.jpg",
  "Gohar Shahi image on moon 20.jpg",
  "Gohar Shahi image on moon 21.jpeg",
  "Gohar Shahi image on moon 22.png",
  "moon_1.jpg",
  "moon_2.jpg",
  "moon_3.jpg",
  "moon_4.jpg",
  "moon_5.jpg",
  "moon_6.jpg",
];
List<String> arro = [
  "122.jpg",
  "13.jpg",
  "101.jpg",
  "102.jpg",
  "103.jpg",
  "104.jpg",
  "105.jpg",
  "106.jpg",
  "107.jpg",
  "108.jpg",
  "109.jpg",
  "10.jpg",
  "110.jpg",
  "111.jpg",
  "112.jpg",
  "113.png",
  "114.jpg",
  "11.jpeg",
  "12.jpeg",
  "100.jpg",
  "115.jpg",
  "14.jpg",
  "15.jpg",
  "116.jpg",
  "16.jpeg",
  "17.jpg",
  "18.jpg",
  "19.jpg",
  "1.jpg",
  "20.jpg",
  "21.jpg",
  "22.jpg",
  "23.jpg",
  "24.jpg",
  "25.jpg",
  "26.jpg",
  "27.jpg",
  "28.jpg",
  "29.jpg",
  "2.jpeg",
  "30.jpg",
  "31.jpg",
  "32.jpg",
  "33.jpg",
  "34.jpg",
  "117.jpg",
  "35.jpg",
  "36.jpg",
  "37.jpg",
  "118.jpg",
  "38.jpg",
  "39.jpg",
  "3.jpg",
  "40.jpg",
  "41.jpg",
  "42.jpg",
  "43.jpg",
  "44.jpg",
  "45.jpg",
  "46.jpg",
  "47.jpg",
  "48.jpg",
  "49.jpg",
  "4.jpeg",
  "50.jpg",
  "119.jpg",
  "51.jpg",
  "52.jpg",
  "53.jpg",
  "54.jpg",
  "120.jpg",
  "55.jpg",
  "56.jpg",
  "57.jpg",
  "58.jpg",
  "59.jpg",
  "5.jpeg",
  "60.jpg",
  "61.jpg",
  "62.jpg",
  "121.jpg",
  "63.jpg",
  "64.jpg",
  "65.jpg",
  "66.jpg",
  "67.jpg",
  "68.jpg",
  "69.jpg",
  "6.jpg",
  "70.jpg",
  "71.jpg",
  "72.jpg",
  "73.jpg",
  "74.jpg",
  "75.jpg",
  "76.jpg",
  "77.jpg",
  "78.jpg",
  "79.jpg",
  "7.jpg",
  "80.jpg",
  "81.jpg",
  "82.jpg",
  "83.jpg",
  "84.jpg",
  "85.jpg",
  "86.jpg",
  "87.jpg",
  "88.jpg",
  "89.jpg",
  "8.jpg",
  "90.jpg",
  "91.jpg",
  "92.jpg",
  "93.jpg",
  "94.jpg",
  "95.jpg",
  "96.jpg",
  "97.jpg",
  "98.jpg",
  "99.jpg",
  "9.jpg",
  "123.jpg",
  "124.jpg",
  "125.jpg",
  "126.jpg",
  "127.jpg",
  "128.jpg",
  "129.jpg",
  "130.jpg",
  "131.jpg",
  "132.jpg",
  "133.jpg",
  "134.jpg",
  "135.jpg",
  "136.jpg",
  "137.jpg",
  "138.jpg",
  "139.jpg",
  "140.jpg",
  "141.jpg",
  "142.jpg",
  "143.jpg",
  "144.jpg",
  "145.jpg",
  "146.jpg",
  "147.jpg",
  "148.jpg",
  "149.jpg",
  "150.jpg",
  "151.jpg",
  "152.jpg",
  "153.jpg",
  "154.jpg",
  "155.jpg",
  "156.jpg",
  "157.jpg",
  "158.jpg",
  "159.jpg",
  "160.jpg",
  "161.jpg",
  "162.jpg",
  "163.jpg",
  "164.jpg",
  "165.jpg",
  "166.jpg",
  "167.jpg",
  "168.jpg",
  "169.jpg",
  "170.jpg",
  "171.jpg",
  "172.jpg",
  "173.jpg",
  "174.jpg",
  "175.jpg",
  "176.jpg",
  "177.jpg",
  "178.jpg",
  "179.jpg",
  "180.jpg",
  "181.jpg",
  "182.jpg",
  "183.jpg",
  "184.jpg",
  "185.jpg",
  "186.jpg",
  "187.jpg",
  "188.jpg",
  "189.jpg",
  "190.jpg",
  "191.jpg",
  "192.jpg",
  "193.jpg",
  "194.jpg",
  "195.jpg",
];
