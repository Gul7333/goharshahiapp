import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gohar_shahi/OtherScreens/ReadBookScreen.dart';
import 'package:gohar_shahi/Widgets/OpenLivePdf.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

// Create a single map for all PDFs
final Map<String, Map<String, dynamic>> pdfData = {
  "The Religion of God": {
    "url": "assets/deenilahicompressed/The-Religion-of-God-compressed.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/Religion-of-God.png",
  },
  "Deen e Ilahi Urdu": {
    "url": "assets/deenilahicompressed/Deen-e-Ilahi-URDu-compressed.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-urdu.png",
  },
  "Deen e Ilahi (Ishwar Dharma) Hindi": {
    "url":
        "assets/deenilahicompressed/Deen e Ilahi (Ishwar Dharma) Shuddh Hindi Book.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-shudh-hindi.png",
  },
  "Deen e Ilahi Bangla": {
    "url": "assets/deenilahicompressed/Deen e Ilahi Bangla.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-ilaahi-bangla.png",
  },
  "Deen e Ilahi Malayalam": {
    "url": "assets/deenilahicompressed/Deen e Ilahi Malayalam-compressed.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-malayalam.png",
  },
  "Deen e Ilahi Pashto": {
    "url":
        "assets/deenilahicompressed/Deen e ilahi Pashto (Internet Version)_compressed.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-pashtu.png",
  },
  "Deen e Ilahi Farsi": {
    "url": "assets/deenilahicompressed/Deen-e-Ilahi_Farsi-compressed.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-farsi.png",
  },
  "Deen e Ilahi Punjabi": {
    "url": "assets/deenilahicompressed/Deen e Ilahi Punjabi.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-punjabi.png",
  },
  "Deen e Ilahi Marathi": {
    "url": "assets/deenilahicompressed/Deen e Ilahi Marathi_compressed.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-marathi.png",
  },
  "Deen e Ilahi Assamese": {
    "url": "assets/deenilahicompressed/Deen-e-Ilahi Assamese.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-assamese.png",
  },
  "Deen e Ilahi Tamil": {
    "url": "assets/deenilahicompressed/deen-e-ilahi-tamil.pdf",
    "isAsset": true,
    "thumbnail": "assets/thumbnails/deen-e-ilaahi-tamil.png",
  },
  "Deen e Ilahi Kashmiri": {
    "url":
        "https://drive.usercontent.google.com/u/0/uc?id=1MOJ2N80LoPHLSiW3-Cx5MEnt97OsF6gi&export=download",
    "isAsset": false,
    "thumbnail": "assets/thumbnails/deen-ilahi-kashmiri-min.png",
  },
};

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends State<BookScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> filteredPdfNames = pdfData.keys.toList();
  FocusNode searchFocus = FocusNode();

  // void openBook(BuildContext context, String url, String title) {

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => ReadBookScreen(bookUrl: url, bookTitle: title),
  //     ),
  //   );
  // }
  @override
  void initState() {
    super.initState();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    // Check if the back key is pressed
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.goBack) {
      searchFocus.unfocus(); // Hide keyboard
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void openBook(bool isAsset, String title, String pdfUrl) {
    // FocusScope.of(context).unfocus();
    searchFocus.unfocus();
    if (isAsset) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ReadBookScreen(bookTitle: title, bookUrl: pdfUrl),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OpenPdf(name: title, pdfUrl: pdfUrl)),
      );
    }
  }

  void _filterBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPdfNames = pdfData.keys.toList();
      } else {
        filteredPdfNames =
            pdfData.keys
                .where(
                  (name) => name.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  @override
  void dispose() {
    searchFocus.dispose(); // ✅ Clean up focus node here
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      //   canPop: false,
      // onPopInvokedWithResult: (bool didPop, dynamic returnValue) {
      //     if (!didPop && searchFocus.hasFocus) {
      //       searchFocus.unfocus(); // remove keyboard focus
      //     }
      //   },
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 100.0,
              title: const Text(
                "Books of Ra Gohar Shahi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 2),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                      focusNode: searchFocus,
                      controller: _searchController,
                      onChanged: _filterBooks,
                      style: TextStyle(color: Colors.white),
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'your language name e.g pashto...',
                        hintStyle: TextStyle(
                          color: Theme.of(context).hintColor,
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        filled: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.outline, // theme-aware color
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.lightBlue, // highlight color
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                if (index < filteredPdfNames.length) {
                  String name = filteredPdfNames[index];
                  Map<String, dynamic> pdfDetails = pdfData[name]!;
                  return BookCard(
                    title: name,
                    pdfUrl: pdfDetails['url'],
                    isAsset: pdfDetails['isAsset'],
                    thumbnailUrl: pdfDetails['thumbnail'],
                    onOpen: openBook,
                  );
                } else {
                  // Final widget after book cards
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Divider(),
                        const SizedBox(height: 20),
                        Text(
                          "That's all for now!",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () {
                            Scrollable.ensureVisible(
                              context,
                              duration: Duration(milliseconds: 500),
                            );
                          },
                          icon: const Icon(Icons.arrow_upward),
                          label: const Text("Scroll to Top"),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  );
                }
              }, childCount: filteredPdfNames.length + 1),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String pdfUrl;
  final bool isAsset;
  final String thumbnailUrl;
  final void Function(bool, String, String) onOpen; // 👈 function type
  const BookCard({
    super.key,
    required this.title,
    required this.pdfUrl,
    required this.isAsset,
    required this.thumbnailUrl,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          onOpen(isAsset, title, pdfUrl);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                thumbnailUrl, // Use the appropriate thumbnail for each book
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
