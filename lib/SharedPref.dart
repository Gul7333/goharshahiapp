import 'package:shared_preferences/shared_preferences.dart';

class GetLocalData {
  // The single instance of the class
  static final GetLocalData _instance = GetLocalData._internal();

  // SharedPreferencesWithCache instance
  late SharedPreferencesWithCache prefsWithCache;

  // A flag to check if initialization has already been done
  bool _isInitialized = false;

  // Private constructor
  GetLocalData._internal();

  // Factory constructor to always return the same instance
  factory GetLocalData() {
    return _instance;
  }

  // Initialize the SharedPreferencesWithCache instance
  Future<void> init() async {
    // Check if the initialization has already been done
    if (_isInitialized) {
      return; // Skip initialization if already done
    }

    prefsWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{'latitude', 'longitude', 'nameofcity'},
      ),
    );

    _isInitialized = true; // Set the flag to true after initialization
  }

  // Save location data
  Future<void> saveLocation(double lat, double lon, String nameofcity) async {
    await prefsWithCache.setDouble('latitude', lat);
    await prefsWithCache.setDouble('longitude', lon);
    await prefsWithCache.setString('nameofcity', nameofcity);
  }

  // Retrieve location data
  Map<String, double>? getLocation() {
    final double? latitude = prefsWithCache.getDouble('latitude');
    final double? longitude = prefsWithCache.getDouble('longitude');

    if (latitude != null && longitude != null) {
      return {'latitude': latitude, 'longitude': longitude};
    }
    return null;
  }
String? nameofcity(){
  return prefsWithCache.getString('nameofcity');
}
  // Clear location data
  Future<void> clearLocation() async {
    await prefsWithCache.remove('latitude');
    await prefsWithCache.remove('longitude');
  }
}
