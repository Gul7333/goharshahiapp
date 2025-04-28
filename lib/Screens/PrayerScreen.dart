import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:gohar_shahi/Locationservice.dart';
import 'package:gohar_shahi/PrayerTimeHelper.dart';
import 'package:gohar_shahi/SharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Map<String, DateTime>? prayerTimes;
  double latitude = 56.348925; // Default coordinates
  double longitude = 71.241590;
  bool isLoading = true;
  String statusMessage = "Fetching location...";
  String timeZoneName = 'Asia/Karachi';
  String? nameofcity = "Islamabad";
  List<Place> allPlaces = [];
  int timeoffset = DateTime.now().timeZoneOffset.inHours;
  DateTime datenow = DateTime.now();
  Timer? timer;
 
  Future<void> refreshLocation() async {
    final prgiven = await LocationService.requestPermission();
    setState(() {
      statusMessage = "Refreshing, just wait";
    });
    if (!prgiven) {
      statusMessage = "Location permision denied";
      return;
    }
    final locationEnabled = await LocationService.isLocationServiceEnabled();
    if (locationEnabled) {
      Position? ps = await LocationService.getCurrentLocation();
      if (ps != null) {
        latitude = ps.latitude;
        longitude = ps.longitude;
        String statusMessagee =
            "Lat: ${latitude.toStringAsFixed(4)}, Long: ${longitude.toStringAsFixed(4)}";

        // Fetch prayer times
        updateCorordinates(latitude, longitude, statusMessagee);

        setState(() {});
      } else {
        statusMessage = "Failed to get location.";
      }
    } else {
      setState(() {
        statusMessage = "Location services are disabled.";
        isLoading = false;
      });
      return;
    }
  }

  void updatePrayerTime() {
    prayerTimes = PrayerTimeHelper.getPrayerTimes(
        latitude: latitude,
        longitude: longitude,
        timeZoneOffset: Duration(hours: timeoffset));
  }

  Future<void> updateCorordinates(
      double lat, double lang, String nameofcity) async {
    latitude = lat;
    longitude = lang;
    nameofcity = nameofcity;
    statusMessage = nameofcity;
    await GetLocalData().saveLocation(latitude, longitude, nameofcity);
    setState(() {});
    updatePrayerTime();
  }

  Future<List<Place>> loadPlaces() async {
    final String response =
        await rootBundle.loadString('assets/worldcities.json');
    final List<dynamic> data = json.decode(response);
    return data.map((placeJson) => Place.fromJson(placeJson)).toList();
  }

  @override
  void initState() {
    super.initState();
    loadPlaces().then((places) {
      allPlaces = places;
    });
    loadFirstTimePrayerTime();
    timer = Timer.periodic(const Duration(seconds: 1), updateEverysecon);
    
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void updateEverysecon(Timer timer) {
    setState(() {
      datenow = DateTime.now();
    });
  }

  Future<void> loadFirstTimePrayerTime() async {
    await GetLocalData().init();
    final localps = GetLocalData().getLocation();
    if (localps != null) {
      latitude = localps['latitude']!;
      longitude = localps['longitude']!;
      nameofcity = GetLocalData().nameofcity();
    }
    updateCorordinates(latitude, longitude, nameofcity ?? "");
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.lightGreen, // Navigation bar color
    //   systemNavigationBarIconBrightness: Brightness.light, // Icon color
    //   statusBarColor: Colors.transparent, // Status bar color
    // ));
     final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      
      appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 13, 223, 20),
          leadingWidth: 60,
          title: const Text("Prayer Time"),
          elevation: 0,
          actions: [
            // need to implet timeoffset update
            PopupMenuButton<int>(
              constraints: const BoxConstraints(maxHeight: 200),
              icon: Text("GMT $timeoffset"),
              tooltip: "Select Timezone Offset",
              onSelected: (value) {
                // Handle the selected timezone offset
                timeoffset = value;
                updatePrayerTime();
                setState(() {});
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                ...timeZones
                    .map((Map<String, String> item) => PopupMenuItem<int>(
                          value: int.parse(item["offset"]!),
                          child: Text(item["name"]!),
                        )),
              ],
            ),
            const Text("select city"),
            IconButton(
              tooltip: "Select your city",
              icon: const Icon(Icons.search),
              onPressed: () async {
                final selectedPlace = await showSearch<Place?>(
                  context: context,
                  delegate: PlaceSearchDelegate(allPlaces),
                );

                if (selectedPlace != null) {
                  // Use the selected item
                  updateCorordinates(double.parse(selectedPlace.lat),
                      double.parse(selectedPlace.lng), selectedPlace.city);
                }
                setState(() {});
              },
            ),
          ]),
      body: Container(
        child: Column(
          children: [
            CustomPaint(
              size: const Size(250, 250),
              painter: ClockPainter(currentTime: datenow, isDark: isDark),
            ),
            // Top Section: Status bar with coordinates and refresh button
            Container(
              height: 40,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      statusMessage,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: refreshLocation,
                    icon: const Icon(Icons.location_on, color: Colors.teal),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Main Content
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    )
                  : (prayerTimes == null
                      ? const Center(
                          child: Text(
                            "No prayer times available.",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: 5 / 3,
                            children: [
                              ...prayerTimes!.entries
                                  .map((entry) => CardPrayer(entry))
                            ],
                            // itemCount: prayerTimes!.length,
                            // itemBuilder: (context, index) {
                            // final entry = prayerTimes!.entries.elementAt(index);
                            //   return CardPrayer(entry);
                            // },
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }

  Card CardPrayer(MapEntry<String, DateTime> entry) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        // margin: const EdgeInsets.symmetric(
        //     vertical: 8, horizontal: 16),
        elevation: 3,
        shadowColor: Colors.teal.shade100,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 6, 245, 14), Color.fromARGB(255, 240, 226, 226)],
          stops: [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
            ,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Icon(
              Icons.mosque,
              color: Colors.teal.shade700,
            ),
            title: Text(
              entry.key,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                      color: Colors.black,

              ),
            ),
            subtitle: Text(
              formatTime(entry.value),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ));
  }

  String formatTime(DateTime time) {
    int hour =
        time.hour % 12 == 0 ? 12 : time.hour % 12; // Convert to 12-hour format
    String minute = time.minute.toString().padLeft(2, '0'); // Ensure two digits
    String period = time.hour >= 12 ? 'PM' : 'AM'; // Determine AM or PM
    return "$hour:$minute $period";
  }
}
class ClockPainter extends CustomPainter {
  final DateTime currentTime;
  final bool isDark;

  ClockPainter({required this.currentTime, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 3;

    // Use theme-aware colors
    final Color dotColor = isDark ? Colors.grey.shade700 : Colors.grey.shade300;
    final Color hourHandColor = isDark ? Colors.white : Colors.black;
    final Color minuteHandColor = isDark ? Colors.white70 : Colors.black;
    final Color secondHandColor = Colors.red;  // Always red for the second hand

    final Paint whiteDotPaint = Paint()
      ..color = dotColor
      ..strokeWidth = 3;

    final Paint hourHandPaint = Paint()
      ..color = hourHandColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    final Paint minuteHandPaint = Paint()
      ..color = minuteHandColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    final Paint secondHandPaint = Paint()
      ..color = secondHandColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    // Calculate the angles for the hour, minute, and second hands
    final double hourAngle =
        (currentTime.hour % 12 + currentTime.minute / 60) * (2 * pi / 12);
    final double minuteAngle = currentTime.minute * (2 * pi / 60);
    final double secondAngle = currentTime.second * (2 * pi / 60);

    // Calculate hand endpoints
    final Offset hourHandEnd = Offset(
      center.dx + radius * 0.5 * cos(hourAngle - pi / 2),
      center.dy + radius * 0.5 * sin(hourAngle - pi / 2),
    );

    final Offset minuteHandEnd = Offset(
      center.dx + radius * 0.7 * cos(minuteAngle - pi / 2),
      center.dy + radius * 0.7 * sin(minuteAngle - pi / 2),
    );

    final Offset secondHandEnd = Offset(
      center.dx + radius * 0.9 * cos(secondAngle - pi / 2),
      center.dy + radius * 0.9 * sin(secondAngle - pi / 2),
    );

    canvas.drawLine(center, hourHandEnd, hourHandPaint);
    canvas.drawLine(center, minuteHandEnd, minuteHandPaint);
    canvas.drawLine(center, secondHandEnd, secondHandPaint);

    radius = radius + 10;
    // Paint for the tick marks
    final tickPaint = Paint()
      ..color = isDark ? Colors.white54 : Colors.black54
      ..strokeWidth = 2;
    final tickPaintSecondary = Paint()
      ..color = isDark ? Colors.white30 : Colors.black26
      ..strokeWidth = 2;

    const int tickCount = 60;

    // Draw the tick marks around the circle
    for (int i = 0; i < tickCount; i++) {
      final double angle = (2 * pi / tickCount) * i;

      // Calculate the start and end points of the tick marks
      final Offset startPoint = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      final Offset endPoint = Offset(
        center.dx + (radius - (i % 5 == 0 ? 18 : 8)) * cos(angle),
        center.dy + (radius - (i % 5 == 0 ? 18 : 8)) * sin(angle),
      );

      // Draw the tick marks
      if (i % 5 == 0) {
        canvas.drawLine(startPoint, endPoint, tickPaint);
      } else {
        canvas.drawLine(startPoint, endPoint, tickPaintSecondary);
      }
    }

    final double textRadius = radius + 20; // Position of text slightly outside the circle
    const int itemCount = 4;
    List<String> times = ["12", "3", "6", "9"];

    for (int i = 0; i < itemCount; i++) {
      // Calculate angle for each prayer time
      final double angle = (2 * pi / itemCount) * i - pi / 2;
      // Calculate text position
      final Offset textOffset = Offset(
        center.dx + textRadius * cos(angle),
        center.dy + textRadius * sin(angle),
      );

      // Paint for the text
      final TextPainter textPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      // Prepare text with color awareness
      textPainter.text = TextSpan(
        text: times[i],
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );

      // Layout and draw text
      textPainter.layout();
      final Offset adjustedOffset = Offset(
        textOffset.dx - textPainter.width / 2,
        textOffset.dy - textPainter.height / 2,
      );
      textPainter.paint(canvas, adjustedOffset);
    }

    canvas.drawCircle(center, 6, whiteDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint on each tick
  }
}

// List of time zones with their offsets
final List<Map<String, String>> timeZones = [
  {'name': 'UTC-12', 'offset': '-12'},
  {'name': 'UTC-11', 'offset': '-11'},
  {'name': 'UTC-10', 'offset': '-10'},
  {'name': 'UTC-9', 'offset': '-9'},
  {'name': 'UTC-8', 'offset': '-8'},
  {'name': 'UTC-7', 'offset': '-7'},
  {'name': 'UTC-6', 'offset': '-6'},
  {'name': 'UTC-5', 'offset': '-5'},
  {'name': 'UTC-4', 'offset': '-4'},
  {'name': 'UTC-3', 'offset': '-3'},
  {'name': 'UTC-2', 'offset': '-2'},
  {'name': 'UTC-1', 'offset': '-1'},
  {'name': 'UTC+0', 'offset': '0'},
  {'name': 'UTC+1', 'offset': '1'},
  {'name': 'UTC+2', 'offset': '2'},
  {'name': 'UTC+3', 'offset': '3'},
  {'name': 'UTC+4', 'offset': '4'},
  {'name': 'UTC+5', 'offset': '5'},
  {'name': 'UTC+6', 'offset': '6'},
  {'name': 'UTC+7', 'offset': '7'},
  {'name': 'UTC+8', 'offset': '8'},
  {'name': 'UTC+9', 'offset': '9'},
  {'name': 'UTC+10', 'offset': '10'},
  {'name': 'UTC+11', 'offset': '11'},
  {'name': 'UTC+12', 'offset': '12'},
];



class PlaceSearchDelegate extends SearchDelegate<Place?> {
  final List<Place> allPlaces;

  PlaceSearchDelegate(this.allPlaces);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search page
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = allPlaces
        .where((place) =>
            place.city.toLowerCase().contains(query.toLowerCase()) ||
            place.country.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final place = results[index];
        return ListTile(
          title: Text(place.city),
          subtitle: Text('${place.country} - Lat: ${place.lat}, Lng: ${place.lng}'),
           onTap: () {
          close(context, place); // Return the selected place
        },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = allPlaces
        .where((place) =>
            place.city.toLowerCase().startsWith(query.toLowerCase()) ||
            place.country.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final place = suggestions[index];
        return ListTile(
          title: Text(place.city),
          subtitle: Text(place.country),
          onTap: () {
          close(context, place); // Return the selected place
        },
        );
      },
    );
  }
}

class Place {
  final String city;
  final String country;
  final String lat;
  final String lng;

  Place({required this.city, required this.country, required this.lat, required this.lng});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      city: json['city'],
      country: json['country'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}