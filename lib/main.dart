import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fvp/fvp.dart' as fvp;
import 'package:gohar_shahi/Helper/ThemeInitializer.dart';
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
    setSystemNavigationBarColor();

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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            scaffoldBackgroundColor: Color(
              0xFFFFF5F5,
            ), // Very light red/pinkish
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFD32F2F), // Deep red
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
              backgroundColor: Color(0xFFFFEBEE), // Light red background
              selectedItemColor: Color(0xFFD32F2F), // Match primary (deep red)
              unselectedItemColor: Color(0xFFB71C1C), // Dark red
              selectedIconTheme: IconThemeData(size: 28),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFFD32F2F),
              brightness: Brightness.light,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black87),
              bodyMedium: TextStyle(color: Colors.black87),
              titleLarge: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            scaffoldBackgroundColor: Color(
              0xFF1B0C0C,
            ), // Dark reddish background
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF8B0000), // Dark red
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
              backgroundColor: Color(0xFF2C1A1A),
              selectedItemColor: Color(0xFFFF6F61), // Soft coral/red
              unselectedItemColor: Colors.white60,
              selectedIconTheme: IconThemeData(size: 28),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFFD32F2F),
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
