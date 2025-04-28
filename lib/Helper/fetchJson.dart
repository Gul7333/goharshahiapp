import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gohar_shahi/Data/booksdata.dart';

class booksManager {
 static Future<urlDatatype>?  _cachedBooksFuture;

  static  Future<urlDatatype> booksJson() {
    _cachedBooksFuture ??= fetchUser();
    return _cachedBooksFuture!;
  }
  
}


Future<urlDatatype> fetchUser() async {
  final prefs = await SharedPreferences.getInstance();
  final cachedData = prefs.getString('userData');
  final cachedTime = prefs.getInt('userDataTime');
   final currentTime = DateTime.now().millisecondsSinceEpoch;
   final expiryTime = Duration(days: 2);


  if (cachedData != null) {
    // If cached data exists, return the parsed data from cache
    try {
      // check expiray date
      if(cachedTime == null || currentTime - cachedTime > expiryTime.inMilliseconds ){
       updateCache();

      }
      List<dynamic> decodedList = jsonDecode(cachedData);

      // Then safely convert each item to Map<String, String> if possible
      List<Map<String, String>> data =
          decodedList.map<Map<String, String>>((item) {
            return {
              'name': item['name'].toString(),
              'url': item['url'].toString(),
            };
          }).toList();
      return urlDatatype.fromJson(data);
    } catch (e) {
      debugPrint("Error parsing cached data: $e");
      throw Exception('Failed to parse cached data');
    }
  } else {
    // Fetch data from the server if no cached data is found
    final dio = Dio();
    final response = await dio.get(
      'https://docs.google.com/document/d/18sS8o4UQIPDyBDep9OHbKR2SR0E0OMfBL9UWmniAdnY/export?format=txt',
    );

    if (response.statusCode == 200) {
      try {
        // Parse the data and cache it
        List<dynamic> rawData = jsonDecode(response.data);
        List<Map<String, String>> data =
            rawData.map((item) {
              return Map<String, String>.from(item);
            }).toList();

        // Cache the result as a string
        await prefs.setString('userData', jsonEncode(data));
        await prefs.setInt("userDataTime", DateTime.now().millisecondsSinceEpoch);

        // Return the parsed data
        return urlDatatype.fromJson(data);
      } catch (e) {
        debugPrint("Error parsing JSON from server: $e");
        throw Exception("Failed to parse JSON from document");
      }
    } else {
      debugPrint("Error fetching data from server");
      throw Exception('Failed to load user');
    }
  }
}


Future<void> updateCache() async{
   final prefs = await SharedPreferences.getInstance();  
   final currentTime = DateTime.now().millisecondsSinceEpoch;

   final dio = Dio();
    final response = await dio.get(
      'https://docs.google.com/document/d/18sS8o4UQIPDyBDep9OHbKR2SR0E0OMfBL9UWmniAdnY/export?format=txt',
    );
    if (response.statusCode == 200) {
      try {
        // Parse the data and cache it
        List<dynamic> rawData = jsonDecode(response.data);
        List<Map<String, String>> data = 
            rawData.map((item) {
              return Map<String, String>.from(item);
            }).toList();
        // Cache the result as a string
        await prefs.setString('userData', jsonEncode(data));
        await prefs.setInt("userDataTime", currentTime);
        debugPrint("cached is upated ++++++");
        // Return the parsed data
        // return urlDatatype.fromJson(data);
      } catch (e) {
        debugPrint("Error parsing JSON from server: $e");
        throw Exception("Failed to parse JSON from document");
      }
    } else {
      debugPrint("Error fetching data from server");
      throw Exception('Failed to load user');
    }
  }

