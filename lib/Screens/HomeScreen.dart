import 'dart:async';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gohar_shahi/Data/intro.dart';
import 'package:gohar_shahi/Helper/message.dart';
import 'package:gohar_shahi/Helper/updateNotifier.dart';
import 'package:gohar_shahi/OtherScreens/Mp3screen.dart';
import 'package:gohar_shahi/RouteAnimation/FadeAnimations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gohar_shahi/Widgets/HtmlViewer.dart';
import 'package:gohar_shahi/Widgets/LifeOfGoharShahi.dart';
import 'package:gohar_shahi/Widgets/YounusAlGohar.dart';
import 'package:gohar_shahi/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> texts = [
    "Different titles, One Personality",
    "Imam Mehdi",
    "Messiah",
    "Kalki Avatar",
  ];
  final PageController _pageController = PageController();
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startAutoPlay();
    checkForUpdate(context);
    checkForMessage(context);
  }
 void _setSystemNavigationBarColor() {

    final brightness = themeNotifier.value == ThemeMode.dark
        ? Brightness.dark
        : themeNotifier.value == ThemeMode.light
            ? Brightness.light
            : WidgetsBinding.instance.platformDispatcher.platformBrightness;

    final isDark = brightness == Brightness.dark;


    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDark ? Color(0xFF1C2238) : Color(0xFFE8F0FF),
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }
  
  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        final nextPage =
            (_pageController.page ?? 0).toInt() + 1; // Move to the next page
        _pageController.animateToPage(
          nextPage % texts.length, // Loop back to the first page
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  // Function to toggle theme mode
  void _toggleTheme() {
    
  final brightness = themeNotifier.value == ThemeMode.system
      ? WidgetsBinding.instance.platformDispatcher.platformBrightness
      : (themeNotifier.value == ThemeMode.dark ? Brightness.dark : Brightness.light);

  themeNotifier.value = brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;

  _setSystemNavigationBarColor();
}

 @override
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;

  return Scaffold(
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
           actions: [
          // Button to toggle theme
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: _toggleTheme,
          ),
        ],
          collapsedHeight: kToolbarHeight,
          expandedHeight: 460,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final double progress = (1.0 -
                      (constraints.maxHeight - kToolbarHeight) / 200.0)
                  .clamp(0.0, 1.0);

              // Dynamic color based on scroll progress
              final Color titleColor = Color.lerp(
                    theme.colorScheme.onPrimary,
                    Colors.white,
                    progress,
                  ) ??
                  theme.colorScheme.onSurface;

              return FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground,
                ],
                collapseMode: CollapseMode.parallax,
                title: Text(
                  "Riaz Ahmed Gohar Shahi",
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                expandedTitleScale: 1.2,
                titlePadding: const EdgeInsets.only(bottom: 14),
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    Image.asset(
                      "assets/SarkarPicture/10.jpg",
                      fit: BoxFit.cover,
                    ),

                    // Gradient Overlay
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      
          // Content Below the Profile Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  slidingtopnames(
                    pageController: _pageController,
                    texts: texts,
                  ),
                  const SizedBox(height: 24),
                  // Social Media Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialCard(
                        Icons.facebook,
                        Colors.blue,
                        "https://web.facebook.com/profile.php?id=61550662965206",
                      ),
                    InkWell(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).push(createDropFadeRoute(Inappwebview(url: "https://www.youtube.com/alratv")));
                        },
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      _buildSocialCard(
                        Icons.message_rounded,
                        Colors.green,
                        "https://wa.me/+447472540642",
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).push(createDropFadeRoute(SongListScreen()));
                        },
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Icon(
                              Icons.audiotrack_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _introScreen(context),

                  const SizedBox(height: 24),
                  TextButton.icon(
                    label: Text("Listen Gohar Shahi's Voice here"),
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(createDropFadeRoute(SongListScreen()));
                    },
                    icon: Icon(
                      Icons.spatial_audio_rounded,
                      semanticLabel: "Play Gohar Shahi's Voice",
                    ),
                  ),

                  SizedBox(height: 12),
                  _buildSectionHeader("Contact"),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 7,
                    children: [
                      _buildContactButton(
                        "Website",
                        Icons.phone,
                        Colors.green,
                        "https://goharshahi.com",
                        false,
                      ),
                      _buildContactButton(
                        "Email",
                        Icons.email,
                        Colors.blue,
                        "ask@younusalgohar.com",
                        true,
                      ),
                      _buildContactButton(
                        "unofficial Website",
                        Icons.web,
                        Colors.orange,
                        "https://gohar-shahi.com",
                        false,
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(createDropFadeRoute(const LifeOfGoharShahi()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/SarkarPicture/11.jpeg",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                             Expanded(
                              child: Text(
                                "The Life Of Gohar Shahi",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(createDropFadeRoute(YounusAlGoharScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/SarkarPicture/15.jpg",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                "Younus AlGohar",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //  const LifeOfGoharShahi(),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to Build Social Cards
  Widget _buildSocialCard(IconData icon, Color color, String Url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          onTap: () {
            openLink(Url);
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: color),
          ),
        ),
      ),
    );
  }

  // Helper to Build Section Headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        
        ),
      ),
    );
  }

  // Helper to Build Contact Buttons
  Widget _buildContactButton(
    String label,
    IconData icon,
    Color color,
    String url,
    bool email,
  ) {
    return ElevatedButton.icon(
      onPressed: () async {
        if (email) {
          final Uri emailUri = Uri(
            scheme: 'mailto',
            path: url,
            queryParameters: {
              'subject': "Gohar Shahi Marhaba",
              'body': "[write your question here]",
            },
          );

          if (await canLaunchUrl(emailUri)) {
            await launchUrl(emailUri);
          } else {
            throw "Could not launch email client";
          }
        } else {
          openLink(url);
        }
      },
      icon: Icon(icon, size: 16, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}


class slidingtopnames extends StatelessWidget {
  const slidingtopnames({
    super.key,
    required PageController pageController,
    required this.texts,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: texts.length,
        itemBuilder: (context, idx) {
          return Center(
            child: Text(
              texts[idx],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _introScreen(BuildContext context) {
  return MarkdownBody(
    softLineBreak: true,
    data: Introduction.intro,
    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
      textAlign: WrapAlignment.center,
      h2: const TextStyle( fontWeight: FontWeight.bold),
      h3: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

// Function to open the URL
Future<void> openLink(String url) async {
  Uri uri = Uri.parse(url);
  // Check if the URL can be launched
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $url";
  }
}
