import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Generic function that fetches and caches data from the internet
Future<T> cachedHttp<T>({
  required String url,
  required String cacheKey,
  required Duration cacheExpiry,
  required T Function(dynamic json) parser, // custom parser from JSON
}) async {
  final prefs = await SharedPreferences.getInstance();
  final cachedData = prefs.getString(cacheKey);
  final cachedTime = prefs.getInt('${cacheKey}_time');
  final currentTime = DateTime.now().millisecondsSinceEpoch;

  if (cachedData != null && cachedTime != null) {
    final isExpired = currentTime - cachedTime > cacheExpiry.inMilliseconds;

    if (!isExpired) {
      try {
        final decodedJson = safeJsonParse(cachedData);
        return parser(decodedJson);
      } catch (e) {
        debugPrint('Error parsing cached data: $e');
        // fallback to fetching again
      }
    }
  }

  // Fetch from network if no cache or expired
  return await _fetchAndCache<T>(
    prefs: prefs,
    url: url,
    cacheKey: cacheKey,
    parser: parser,
    timeOverride: currentTime,
  );
}

Future<T> _fetchAndCache<T>({
  required SharedPreferences prefs,
  required String url,
  required String cacheKey,
  required T Function(dynamic json) parser,
  int? timeOverride,
}) async {
  final dio = Dio();
  final response = await dio.get(url);

  if (response.statusCode == 200) {
    try {
      final jsonData = response.data is String ? safeJsonParse(response.data) : response.data;
      final parsed = parser(jsonData);

      await prefs.setString(cacheKey, jsonEncode(jsonData));
      await prefs.setInt('${cacheKey}_time', timeOverride ?? DateTime.now().millisecondsSinceEpoch);

      return parsed;
    } catch (e) {
      debugPrint("Error parsing fetched data: $e");
      throw Exception('Failed to parse fetched data');
    }
  } else {
    throw Exception('Failed to fetch data from server');
  }
}
dynamic safeJsonParse(String source) {
  try {
    return json.decode(source);
  } catch (e) {
    debugPrint('JSON Decode Error: $e');
    return {'__raw__': source}; // wrap raw data in a map
  }
}
