
import 'package:gohar_shahi/Data/data.dart';
import 'package:gohar_shahi/Data/wilayatmolaali.dart';
import 'package:gohar_shahi/OtherScreens/BeautifullList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gohar_shahi/RouteAnimation/FadeAnimations.dart';
import 'package:gohar_shahi/Widgets/ZikarCard.dart';
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
          return ZikrCard(zikr: data[idx]);
        },
      ),
    );
  }
}


//  images and videos

//  video player

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
                return ZikrCardKalki(zikr: Kalki.data[idx]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Future<void> saveToExternalStorage(Uint8List bytes, String fileName) async {
//   try {
//     // Request storage permissions
//     if (await Permission.storage.request().isGranted) {
//       // Get external storage directory
//       // Directory? externalDir = Directory("/storage/0/emulated/Download");
//       // if (externalDir != null) {
//       // final String filePath = '${externalDir.path}/$fileName';
//       // Write the file

//       Gal.putImageBytes(bytes, album: "Download", name: fileName);
//       // final File file = File(filePath);
//       // await file.writeAsBytes(bytes);
//       // print('File saved to $filePath');
//       // } else {
//       //   print('External storage directory not found');
//       // }
//     } else {
//       // print('Permission denied');
//       //   ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text('permission denied'),
//       //     duration: Duration(seconds: 2),
//       //   ),
//       // );
//     }
//   } catch (e) {
//     // print('Error saving file: $e');
//   }
// }
