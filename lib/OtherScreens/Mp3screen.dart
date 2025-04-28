import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gohar_shahi/Helper/Audioplayer.dart';
import 'package:gohar_shahi/Helper/downloadandsavemp3.dart';
import 'package:gohar_shahi/Helper/fetchMusic.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  SongListScreenState createState() => SongListScreenState();
}

class SongListScreenState extends State<SongListScreen> {
  List<AudioItem> localSongs = [
    AudioItem.fromJson({
      "Name": "Justuju e Yaar Mein",
      "Url":
          "assets/Qasida/Qasida_ Justuju e Yaar Mein Hasti Ko Khona Chahiye.opus",
    }),

    AudioItem.fromJson({
      "Name": "Mast Aankhon Ki Qassam",
      "Url":
          "assets/Qasida/Mast Aankhon Ki Qassam Khanay Ka Mausam Aa Gaya _ Qawwali _ ALRA TV.opus",
    }),
    AudioItem.fromJson({
      "Name": "Wird e Lab Raat Dinn",
      "Url":
          "assets/Qasida/Wird e Lab Raat Dinn _ Sufi Nadeem ft. Rizwan Gohar.m4a",
    }),
    AudioItem.fromJson({
      "Name": "Na Ho Mayoos Pur Umeed reh",
      "Url":
          "assets/Qasida/Qasida_ Na Ho Mayoos Pur Umeed Reh Gohar Ko Aana Hai _ Sayyidi Younus AlGohar.m4a",
    }),

    AudioItem.fromJson({
      "Name": "Manam adna gulam e Riaz Shahi ",
      "Url":
          "assets/Qasida/Manam adna gulam e Riaz Shah e Ishq Riazum Ra _ Qaseeda e Gohar Shahi _ hafiz Nadeem.opus",
    }),
    AudioItem.fromJson({
      "Name": "Gohar Shahi Voice",
      "Url": "assets/zikree.aac"
    }),
  ];
  final AudioPlayer _audioPlayer = AudioManager.instance.player;
  int? _playingIndex; // remote
  int? _playingLocalIndex;

  bool _isPlaying = false;
  List<AudioItem> songs = [];
  // late Future<List<AudioItem>> _songsFuture; // Future to fetch songs
  bool songsLoaded = false;
  List<int> isDownloading = [];
  List<String> downloaded = [];
  final List<Color> colors = [
    Colors.deepPurple,
    Colors.teal,
    Colors.orange,
    Colors.indigo,
    Colors.pink,
    Colors.green,
    Colors.blueAccent,
  ];

  @override
  void initState() {
    super.initState();
    // fetches json data from google docs
    // _songsFuture = fetchMusic();
    // Initialize from singleton
    _playingIndex = AudioManager.instance.playingRemoteIndex;
    _playingLocalIndex = AudioManager.instance.playingLocalIndex;
    _isPlaying = AudioManager.instance.isPlaying;

    _audioPlayer.playerStateStream.listen((state) {
      if (!mounted) return;

      setState(() {
        _isPlaying = state.playing;
        // AudioManager.instance.isPlaying = state.playing;
        if (state.processingState == ProcessingState.completed) {
          _playingIndex = null; // Reset when song finishes
          AudioManager.instance.playingLocalIndex = null;

          AudioManager.instance.playingRemoteIndex = null;
          
        }
      });
    });
  }

  Future<void> _openLink(String url) async {
    Uri uri = Uri.parse(url);
    // Check if the URL can be launched
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  void _playPause(int index) async {
  
  
    if (_playingIndex == index) {
      // handle if currenlty this song is playing
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play();
      }
    } else {
      if (_isPlaying) await _audioPlayer.stop();
      _playingLocalIndex = null;
            AudioManager.instance.playingLocalIndex = null;

      // handle fetching file , will be downloaded if not found

      final file = await Mp3Manager.downloadMp3(
        fileName: songs[index].name,
        url: songs[index].url,
      );

      if (file == null) return;
      await _audioPlayer.setFilePath(file);

      _playingIndex = index;
      // In _playPause and _playPauseLocal
      AudioManager.instance.playingRemoteIndex= index;
      await _audioPlayer.play();
    }
  }

  void _playPauseLocal(int index) async {
 
      _playingIndex = null;
      AudioManager.instance.playingRemoteIndex = null;

    if (_playingLocalIndex == index) {
      // handle if currenlty this song is playing
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play();
      }
    } else {
      if (_isPlaying) await _audioPlayer.stop();
      // handle asset mp3
      await _audioPlayer.setAsset(localSongs[index].url);
      _playingLocalIndex = index;
      // In _playPause and _playPauseLocal
      AudioManager.instance.playingLocalIndex = index;

      await _audioPlayer.play();
    }
  }

  Future<bool> _checkIfMp3Exists(String fileName) async {
    return await Mp3Manager.mp3Exists(fileName);
  }

  // main function
  Future<void> downloadOrPlay(int index) async {
    

    if (await _checkIfMp3Exists(songs[index].name)) {
      _playPause(index);
    } else {
      try {
        isDownloading.add(index);
        if (mounted) setState(() {});
        await Mp3Manager.downloadMp3(
          url: songs[index].url,
          fileName: songs[index].name,
        );
        isDownloading.remove(index);
        _playPause(index);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void dispose() {
    // _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qasida e Gohar Shahi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  local Asset songs
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: localSongs.length,
              itemBuilder: (context, index) {
                final song = localSongs[index];
                final isPlaying = _playingLocalIndex == index && _isPlaying;
                final baseColor = colors[index % colors.length];
                return mp3card(index, baseColor, song, isPlaying, true);
              },
            ),
            Text("Below is list of Online Qasida "),
            TextButton.icon(
              icon: Icon(Icons.mail),
              onPressed:
                  () => _openLink("mailto:pro.dev.solution.pk@gmail.com"),
              autofocus: true,
              label: Text("Send us Your Qasida also "),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  9,
                  78,
                  134,
                ).withValues(alpha: 20), // light blue background
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            FutureBuilder<List<AudioItem>>(
              future: Mp3Manager.songsJson, // Use the stored future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading spinner while data is being fetched
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  songs = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      final isPlaying = _playingIndex == index && _isPlaying;
                      final baseColor = colors[index % colors.length];
                      // Use FutureBuilder to check if MP3 exists asynchronously
                      return mp3card(index, baseColor, song, isPlaying, false);
                    },
                  );
                }
                return Center(child: Text('No data available'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          _isPlaying
              ? FloatingActionButton(
                onPressed: () => _audioPlayer.stop(),
             
                child: Icon(Icons.stop),
              )
              : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startFloat, // Right side
    );
  }

  Card mp3card(
    int index,
    Color baseColor,
    AudioItem song,
    bool isPlaying,
    bool local,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        // onTap: () => _playPause(index),
        onTap: () => !local ? downloadOrPlay(index) : _playPauseLocal(index),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [baseColor.withOpacity(0.6), baseColor.withOpacity(0.85)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Icon(FontAwesomeIcons.music, color: baseColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "${song.name}  ${isDownloading.contains(index) ? "Downloading" : ""}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                icon:
                   
                         Icon(
                          (isPlaying 
                              ? Icons.pause_circle
                              : Icons.play_circle),
                          size: 30,
                          color: Colors.white,
                        ),
                onPressed:
                    () =>
                        !local ? downloadOrPlay(index) : _playPauseLocal(index),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
