
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gohar_shahi/Helper/fetchJson.dart';
import 'package:gohar_shahi/OtherScreens/Websites.dart';
import 'package:gohar_shahi/RouteAnimation/FadeAnimations.dart';
import 'package:gohar_shahi/Screens/PrayerScreen.dart';
import 'package:gohar_shahi/Widgets/HtmlViewer.dart';
import 'package:gohar_shahi/Widgets/OpenLivePdf.dart';


class Otherscreen extends StatelessWidget {
  const Otherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Prayers',
        'subtitle': 'Prayer times',
        'icon': FontAwesomeIcons.handsPraying,
        'color': Colors.orange,
        'onTap': () => Navigator.of(context).push(createDropFadeRoute(PrayerScreen())),
      },
      {
        'title': 'More books',
        'subtitle': 'Some important books',
        'icon': FontAwesomeIcons.book,
        'color': Colors.teal,
        'onTap': () => Navigator.of(context).push(createDropFadeRoute(PDFHome())),
      },
      {
        'title': 'Official websites',
        'subtitle': 'Links of Official websites',
        'icon': FontAwesomeIcons.globe,
        'color': Colors.deepPurple,
        'onTap': () => Navigator.of(context).push(createDropFadeRoute(WebsiteScreen())),
      },
        {
        'title': 'Official LinkTree of Alra tv',
        'subtitle': 'Links of Official websites',
        'icon': FontAwesomeIcons.link,
        'color': const Color.fromARGB(255, 83, 52, 138),
        'onTap': () => Navigator.of(context).push(createDropFadeRoute(LinktreeViewer())),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Other Features",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final baseColor = item['color'] as Color;

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  baseColor.withOpacity(0.7),
                  baseColor.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: baseColor.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  item['icon'] as IconData,
                  color: baseColor,
                ),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                item['subtitle'] as String,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              onTap: item['onTap'] as void Function(),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}


// // book screen



class PDFHome extends StatefulWidget {
  @override
  _PDFHomeState createState() => _PDFHomeState();
}

class _PDFHomeState extends State<PDFHome> {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.deepPurple,
      Colors.teal,
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.redAccent,
      Colors.pink,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Some Important Books"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: booksManager.booksJson(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: Check Your Internet Conection"),
              );
            }
            
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final items = snapshot.data!.data;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final book = items[index];
                  final color = colors[index % colors.length];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenPdf(
                              pdfUrl: book.url,
                              name: book.name,
                            ),
                          ),
                        );
                      },
                      
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
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
                              child: Icon(FontAwesomeIcons.bookOpen, color: color),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                book.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Icon(Icons.picture_as_pdf, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}


