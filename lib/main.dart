import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:gohar_shahi/Screens/BookScreen.dart';
import 'package:gohar_shahi/Screens/GalleryScreen.dart';
import 'package:gohar_shahi/Screens/HomeScreen.dart';
import 'package:gohar_shahi/Screens/OtherScreen.dart';
import 'package:gohar_shahi/Screens/ReferenceScreen.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:timezone/data/latest.dart' as tz;

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);
// final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  fvp.registerWith(); // Register FVP before creating any player

  tz.initializeTimeZones();
// Enable Pdfium WASM support
Pdfrx.webRuntimeType = PdfrxWebRuntimeType.pdfiumWasm;
  // _startBackgroundDownloads();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        // Set system nav bar color
        // setSystemUIOverlayStyle(brightness);
        return MaterialApp(
          //  navigatorObservers: [routeObserver],
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            scaffoldBackgroundColor: Color(0xFFF5F8FF),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF3F51B5), // Blue Indigo
              foregroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFFE8F0FF),
              selectedItemColor: Color(0xFF3F51B5), // Match primary
              unselectedItemColor: Color(0xFF8FA8C8),
              selectedIconTheme: IconThemeData(size: 28),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF3F51B5),
              brightness: Brightness.light,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              bodyMedium: TextStyle(color: Colors.black),
              titleLarge: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIconColor: Colors.grey.shade700,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF3F51B5), width: 2),
              ),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            scaffoldBackgroundColor: Color(0xFF121A2E),

            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1A237E),
              foregroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF1C2238),
              selectedItemColor: Color(0xFF90CAF9),
              unselectedItemColor: Colors.white60,
              selectedIconTheme: IconThemeData(size: 28),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF3F51B5),
              brightness: Brightness.dark,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              titleLarge: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: Colors.white70),
              prefixIconColor: Colors.white70,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white38, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF90CAF9), width: 2),
              ),
            ),
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Homescreen(),
    const BookScreen(),
    const Referencescreen(),
    const Gallery(),
    const Otherscreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        height: 60, // Adjust the height to your desired value (e.g., 50px)
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withValues(
          alpha: (colorScheme.primary.a * 0.1).toDouble(), // Adjust opacity
          red: colorScheme.primary.r.toDouble(),
          green: colorScheme.primary.g.toDouble(),
          blue: colorScheme.primary.b.toDouble(),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.houseChimneyCrack),
            selectedIcon: FaIcon(FontAwesomeIcons.houseChimney),
            label: 'Home',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.book),
            selectedIcon: FaIcon(FontAwesomeIcons.bookOpen),
            label: 'Books',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.scroll),
            selectedIcon: FaIcon(FontAwesomeIcons.solidFileLines),
            label: 'Reference',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.images),
            selectedIcon: FaIcon(FontAwesomeIcons.image),
            label: 'Gallery',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.ellipsis),
            selectedIcon: FaIcon(FontAwesomeIcons.ellipsisVertical),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
