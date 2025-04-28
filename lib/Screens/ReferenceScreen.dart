import 'dart:typed_data';

import 'package:gohar_shahi/Data/data.dart';
import 'package:gohar_shahi/Data/wilayatmolaali.dart';
import 'package:gohar_shahi/OtherScreens/BeautifullList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gal/gal.dart';
import 'package:gohar_shahi/RouteAnimation/FadeAnimations.dart';
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
// import 'package:fvp/fvp.dart' as fvp;

class Referencescreen extends StatelessWidget {
  const Referencescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "References",
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              "Here are Some References For Goharians",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          BeautifulListTile(
            title: "Dill ka zikr(namdan)",
            subtitle: "Importance Of Heart and Zikr",
            icon: FontAwesomeIcons.heartPulse,
            reference: "",
            grad: 1,
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Listofreffertype(
                            dataChunk: zikrDataa,
                            titlename: "Dill Aur Dill ka zikr",
                          ),
                    ),
                  ),
                },
          ),
          BeautifulListTile(
            title: "Imam Mehdi (alehi salam)",
            subtitle: "Importance of Imam Mehdi",
            icon: Icons.nightlight_round_outlined,
            reference: "",
            grad: 0,
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Listofreffertype(
                            dataChunk: ImamMehdi,
                            titlename: "Imam Mehdi",
                          ),
                    ),
                  ),
                },
          ),
          BeautifulListTile(
            icon: Icons.perm_media_rounded,
            title: "Gaibat e Imam Mehdi",
            subtitle: "Disappearance of the expected Imam",
            reference: "",
            onTap: () {
              Navigator.of(context).push(
                createDropFadeRoute(
                  Listofreffertype(
                    dataChunk: ocultation,
                    titlename: "Gaibat e Imam mehdi",
                  ),
                ),
              );
            },
            grad: 1,
          ),
          BeautifulListTile(
            title: "Mola Ali (alehi salam)",
            subtitle: "Importance of Mola Ali",
            icon: Icons.mosque,
            reference: "",
            grad: 1,
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Listofreffertype(
                            dataChunk: wilayatMolaAli,
                            titlename: "Hazrat Mola Ali",
                          ),
                    ),
                  ),
                },
          ),
          BeautifulListTile(
            icon: FontAwesomeIcons.flag,
            title: "Kalki Avatar",
            subtitle: "Some references from Sanatan Dharma",
            reference: "",
            onTap: () {
              Navigator.of(context).push(createDropFadeRoute(KalkiAvatar()));
            },
            grad: 1,
          ),

          BeautifulListTile(
            icon: FontAwesomeIcons.moon,
            title: "Divine Signs",
            subtitle: "Images and Videos",
            reference: "",
            onTap: () {
              Navigator.of(context).push(createDropFadeRoute(ProodFullView()));
            },
            grad: 1,
          ),
          // const BeautifulListTile(title: "Importance Of Tareeqat", subtitle: "Rah e Tareeqat ki Ahmiyat", reference: "20"),
          // const BeautifulListTile(title: "Importance Of Spritual bodies", subtitle: "Lataif ki Ahmiyat", reference: "20")
        ],
      ),
    );
  }
}

class Listofreffertype extends StatelessWidget {
  final Referr dataChunk;
  final String titlename;

  const Listofreffertype({
    super.key,
    required this.dataChunk,
    required this.titlename,
  });

  void GoToDetail(BuildContext context, List<ZikrData> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Listofdata(data: data, titlename: titlename),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlename),
      ),
      body: Column(
        children: [
          BeautifulListTile(
            title: "Quran ayaat",
            subtitle: "Quran sy saboot",
            reference: "",
            icon: Icons.library_books,
            grad: 1,
            onTap: () {
              GoToDetail(context, dataChunk.Quran);
            },
          ),
          BeautifulListTile(
            title: "Hadees",
            subtitle: "Hadees sy saboot",
            reference: "",
            grad: 0,
            icon: Icons.library_books,
            onTap: () {
              GoToDetail(context, dataChunk.Hadees);
            },
          ),
          BeautifulListTile(
            title: "Aulia",
            subtitle: "Aulia sy saboot",
            grad: 1,
            reference: "",
            icon: Icons.library_books,
            onTap: () {
              GoToDetail(context, dataChunk.Aulia);
            },
          ),
        ],
      ),
    );
  }
}

class Listofdata extends StatelessWidget {
  final List<ZikrData> data;
  final String titlename;
  const Listofdata({super.key, required this.data, required this.titlename});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$titlename (${data.length})")),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, idx) {
          return HadithDisplayWidget(hadithData: data[idx]);
        },
      ),
    );
  }
}

class HadithDisplayWidget extends StatelessWidget {
  final ZikrData hadithData;

  HadithDisplayWidget({super.key, required this.hadithData});

  // GlobalKey for capturing the widget as an image
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          RepaintBoundary(
            key: _repaintBoundaryKey,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfffbed96), Color(0xffabecd6)],
                    stops: [0, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // color: Colors.black
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        hadithData.reference,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        hadithData.arabic,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: '',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Translations:',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildTranslationSection(
                        'Urdu:',
                        hadithData.translation.ur,
                      ),
                      _buildTranslationSection(
                        'Hindi:',
                        hadithData.translation.hi,
                      ),
                      _buildTranslationSection(
                        'English:',
                        hadithData.translation.en,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook),
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.youtube, // FontAwesome icon
                            size: 20.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.twitter, // FontAwesome icon
                            size: 20.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 7),
                          Text("Alra tv"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -3,
            right: 0,
            child: TextButton.icon(
              icon: const FaIcon(FontAwesomeIcons.image),
              onPressed: () {
                saveAsImage(context);
              },
              label: const Text("save"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTranslationSection(String language, String translation) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   language,
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
          const SizedBox(height: 5),
          Text(
            translation,
            textAlign: TextAlign.center,
            textDirection:
                language == "Urdu:" ? TextDirection.rtl : TextDirection.ltr,
            style:
                language == "Urdu:"
                    ? const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "urdu",
                    )
                    : const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Future<void> saveAsImage(BuildContext context) async {
    try {
      await Future.delayed(Duration.zero); // Ensure UI thread is idle
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final RenderRepaintBoundary boundary =
            _repaintBoundaryKey.currentContext!.findRenderObject()
                as RenderRepaintBoundary;

        final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        final ByteData? byteData = await image.toByteData(
          format: ui.ImageByteFormat.png,
        );
        final Uint8List pngBytes = byteData!.buffer.asUint8List();

        final String timeStamp =
            DateTime.now().millisecondsSinceEpoch.toString();
        final String filename = 'Gohar_Shahi_$timeStamp';
        // Gal.putImageBytes(pngBytes,album: "Download",name: filename);
        await saveToExternalStorage(pngBytes, filename);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image saved as $filename'),
            duration: const Duration(seconds: 2),
          ),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving image: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

//  images and videos

class ProodFullView extends StatelessWidget {
  const ProodFullView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Allah Ki Nishaniyan(Divine Signs)")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          // spacing: 7,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/proofs/moon_1.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/proofs/moon_2.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/proofs/moon_3.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/proofs/moon_4.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/proofs/moon_5.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/proofs/moon_6.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/proofs/moon_7.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8),
            Image.asset(
              "assets/proofs/moon_8.jpg",
              width: 300,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
            InkWell(
              onTap:
                  () => Navigator.of(context).push(
                    createDropFadeRoute(
                      VideoPlayerScreen(videoUrl: "assets/proofs/1.mp4"),
                    ),
                  ),
              child: Card(
                surfaceTintColor: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 17),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    "Video 1 (click here)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, color: Colors.blue),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap:
                  () => Navigator.of(context).push(
                    createDropFadeRoute(
                      VideoPlayerScreen(videoUrl: "assets/proofs/2.mp4"),
                    ),
                  ),
              child: Card(
                surfaceTintColor: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 17),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    "Video 2 (click here)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, color: Colors.blue),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap:
                  () => Navigator.of(context).push(
                    createDropFadeRoute(
                      VideoPlayerScreen(videoUrl: "assets/proofs/3.mp4"),
                    ),
                  ),
              child: Card(
                surfaceTintColor: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 17),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    "Video 3 (click here)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, color: Colors.blue),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap:
                  () => Navigator.of(context).push(
                    createDropFadeRoute(
                      VideoPlayerScreen(videoUrl: "assets/proofs/4.mp4"),
                    ),
                  ),
              child: Card(
                surfaceTintColor: Colors.blue,
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 17),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    "Video 4 (click here)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23, color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  video player

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
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

class KalkiAvatar extends StatelessWidget {
  const KalkiAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kalki Avatar")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Kalki is an important figure in Hindu mythology, known as the final avatar of Lord Vishnu. He is believed to appear during the darkest period of human history to restore righteousness (dharma). The name ‘Kalki’ comes from the Sanskrit word ‘kalka,’ meaning impurity or darkness, symbolizing the end of an era filled with chaos.\nAccording to Hindu beliefs, Lord Vishnu takes different forms (avatars) to protect the world and maintain balance. Kalki, as the tenth and final avatar in the Dashavatara (ten incarnations of Vishnu), represents the hope for renewal and the return of justice at the end of Kali Yuga, the current age of moral decline.",
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // Ensures it takes only necessary space
              physics:
                  NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
              itemCount: Kalki.data.length,
              itemBuilder: (context, idx) {
                return ShowKalkiData(kalkiitem: Kalki.data[idx]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShowKalkiData extends StatelessWidget {
  final Kalkidataitem kalkiitem;

  ShowKalkiData({super.key, required this.kalkiitem});

  // GlobalKey for capturing the widget as an image
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          RepaintBoundary(
            key: _repaintBoundaryKey,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfffbed96), Color(0xffabecd6)],
                    stops: [0, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // color: Colors.black
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        kalkiitem.reference,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        kalkiitem.sanskrit,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: '',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Translations:',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildTranslationSection(
                        'Urdu:',
                        kalkiitem.translation.ur,
                      ),
                      _buildTranslationSection(
                        'Hindi:',
                        kalkiitem.translation.hi,
                      ),
                      _buildTranslationSection(
                        'English:',
                        kalkiitem.translation.en,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook),
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.youtube, // FontAwesome icon
                            size: 20.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.twitter, // FontAwesome icon
                            size: 20.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 7),
                          Text("Alra tv"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -3,
            right: 0,
            child: TextButton.icon(
              icon: const FaIcon(FontAwesomeIcons.image),
              onPressed: () {
                saveAsImage(context);
              },
              label: const Text("save"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTranslationSection(String language, String translation) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   language,
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
          const SizedBox(height: 5),
          Text(
            translation,
            textAlign: TextAlign.center,
            textDirection:
                language == "Urdu:" ? TextDirection.rtl : TextDirection.ltr,
            style:
                language == "Urdu:"
                    ? const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "urdu",
                    )
                    : const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Future<void> saveAsImage(BuildContext context) async {
    try {
      await Future.delayed(Duration.zero); // Ensure UI thread is idle
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final RenderRepaintBoundary boundary =
            _repaintBoundaryKey.currentContext!.findRenderObject()
                as RenderRepaintBoundary;

        final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        final ByteData? byteData = await image.toByteData(
          format: ui.ImageByteFormat.png,
        );
        final Uint8List pngBytes = byteData!.buffer.asUint8List();

        final String timeStamp =
            DateTime.now().millisecondsSinceEpoch.toString();
        final String filename = 'Gohar_Shahi_$timeStamp';
        // Gal.putImageBytes(pngBytes,album: "Download",name: filename);
        await saveToExternalStorage(pngBytes, filename);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image saved as $filename'),
            duration: const Duration(seconds: 2),
          ),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving image: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

Future<void> saveToExternalStorage(Uint8List bytes, String fileName) async {
  try {
    // Request storage permissions
    if (await Permission.storage.request().isGranted) {
      // Get external storage directory
      // Directory? externalDir = Directory("/storage/0/emulated/Download");
      // if (externalDir != null) {
      // final String filePath = '${externalDir.path}/$fileName';
      // Write the file

      Gal.putImageBytes(bytes, album: "Download", name: fileName);
      // final File file = File(filePath);
      // await file.writeAsBytes(bytes);
      // print('File saved to $filePath');
      // } else {
      //   print('External storage directory not found');
      // }
    } else {
      // print('Permission denied');
      //   ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('permission denied'),
      //     duration: Duration(seconds: 2),
      //   ),
      // );
    }
  } catch (e) {
    // print('Error saving file: $e');
  }
}
