import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _cacheKey = 'musicData';
const String _cacheTimeKey = 'musicDataTime';
const Duration _expiryTime = Duration(days: 1);
const String _mainUrl = "https://docs.google.com/document/d/1wSeixvPOS0P-x60AdohUbN76eODtFKLZITewSYG3icI/export?format=txt";

Future<List<AudioItem>> fetchMusic() async {
  final prefs = await SharedPreferences.getInstance();
  final cachedData = prefs.getString(_cacheKey);
  final cachedTime = prefs.getInt(_cacheTimeKey);
  final currentTime = DateTime.now().millisecondsSinceEpoch;

  if (cachedData != null) {
    try {
      if (_isCacheExpired(cachedTime, currentTime)) {
        updateCache();
      }

      final List<AudioItem> audioList = _parseAudioList(cachedData);
      await _cacheData(prefs, audioList);
      return audioList;
    } catch (e) {
      debugPrint("Error parsing cached data: $e");
      throw Exception('Failed to parse cached data');
    }
  } else {
    return await _fetchFromServerAndCache(prefs, _mainUrl);
  }
}

Future<void> updateCache() async {
  final prefs = await SharedPreferences.getInstance();
  final currentTime = DateTime.now().millisecondsSinceEpoch;
  await _fetchFromServerAndCache(prefs, _mainUrl, timeOverride: currentTime);
}

bool _isCacheExpired(int? cachedTime, int currentTime) {
  return cachedTime == null ||
      currentTime - cachedTime > _expiryTime.inMilliseconds;
}

Future<List<AudioItem>> _fetchFromServerAndCache(SharedPreferences prefs, String url, {int? timeOverride}) async {
  final dio = Dio();
  final response = await dio.get(url);

  if (response.statusCode == 200) {
    try {
      final List<dynamic> jsonData = jsonDecode(response.data);
      final List<AudioItem> audioList =
          jsonData.map((item) => AudioItem.fromJson(item)).toList();

      await _cacheData(prefs, audioList, timeOverride: timeOverride);
      return audioList;
    } catch (e) {
      debugPrint("Error parsing JSON from server: $e");
      throw Exception("Failed to parse JSON from document");
    }
  } else {
    debugPrint("Error fetching data from server");
    throw Exception('Failed to load user');
  }
}

List<AudioItem> _parseAudioList(String jsonStr) {
  final List<dynamic> jsonData = jsonDecode(jsonStr);
  return jsonData.map((item) => AudioItem.fromJson(item)).toList();
}

Future<void> _cacheData(SharedPreferences prefs, List<AudioItem> audioList, {int? timeOverride}) async {
  await prefs.setString(_cacheKey, jsonEncode(audioList));
  await prefs.setInt(
    _cacheTimeKey,
    timeOverride ?? DateTime.now().millisecondsSinceEpoch,
  );
  debugPrint("Cache updated successfully");
}

class AudioItem {
  final String name;
  final String url;

  AudioItem({required this.name, required this.url});

  factory AudioItem.fromJson(Map<String, dynamic> json) {
    return AudioItem(name: json['Name'], url: json['Url']);
  }

  Map<String, dynamic> toJson() {
    return {'Name': name, 'Url': url};
  }
}
