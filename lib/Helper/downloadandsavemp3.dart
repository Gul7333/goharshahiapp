import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:gohar_shahi/Helper/fetchMusic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class Mp3Manager {
   static  List<String> downloadedSongs = [];
    static Future<List<AudioItem>>? _cachedSongsJson;

// Public static getter that ensures single fetch
  static Future<List<AudioItem>> get songsJson {
    _cachedSongsJson ??= fetchMusic();
     return _cachedSongsJson!;
  }
  /// Downloads a PDF file from the given URL or returns cached path
  ///
  /// [url] - The remote URL of the Mp3 file
  /// [fileName] - The name to save the file with (include .mp3 extension)
  /// [onProgress] - Optional callback for download progress updates
  ///
  /// Returns:
  /// - On web: returns the original URL
  /// - On mobile: returns local file path if successful, null if failed
  static Future<String?> downloadMp3({
    required String url,
    required String fileName,
    void Function(int received, int total)? onProgress,
  }) async {
    try {
      // On web platform, we can't download files locally, return the URL
      if (kIsWeb) {
        return url;
      }

      // Validate URL
      if (!url.startsWith('http')) {
        throw Exception('Invalid URL: Must start with http/https');
      }

      // Get application documents directory
      final Directory dir = await getApplicationDocumentsDirectory();
      final String filePath = '${dir.path}/$fileName';

      // Check if file already exists
      final File file = File(filePath);
      if (await file.exists()) {
        return filePath;
      }

      // Download file with Dio  
      final Dio dio = Dio();
      final Response response = await dio.download(
        url,
        filePath,
        onReceiveProgress: onProgress,
        // options: Options(
        //   responseType: ResponseType.bytes,
        //   followRedirects: true,
        //   receiveTimeout: const Duration(seconds: 30),
        // ),
      );

      // Verify download was successful
      if (response.statusCode != 200) {
        throw Exception('Failed to download file: HTTP ${response.statusCode}');
      }

      return filePath;
    } catch (e) {
      debugPrint("Error downloading PDF: $e");
      rethrow;
    }
  }

  /// Deletes a previously downloaded PDF file
  static Future<bool> deleteMp3(String fileName) async {
    try {
      if (kIsWeb) {
        return false; // Can't delete files on web
      }

      final Directory dir = await getApplicationDocumentsDirectory();
      final String filePath = '${dir.path}/$fileName';
      final File file = File(filePath);

      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint("Error deleting PDF: $e");
      return false;
    }
}


static Future<void> checkIfMp3ExistsforAllSongs(List<AudioItem> songs) async {
    for (AudioItem item in songs) {
      bool exist = await mp3Exists(item.name);
      if (exist) {
        downloadedSongs.add(item.name);
    }
  }
}
  /// Checks if a PDF file exists locally
  static Future<bool> mp3Exists(String fileName) async {
    if (kIsWeb) {
      return false; // Local files don't exist on web
    }

    final Directory dir = await getApplicationDocumentsDirectory();
    final String filePath = '${dir.path}/$fileName';
    return File(filePath).exists();
  }

  /// Gets the local path for a Mp3 file (doesn't verify existence)
  static Future<String> getLocalPath(String fileName) async {
    if (kIsWeb) {
      throw Exception('Local paths not available on web');
    }

    final Directory dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/$fileName';
  }
}
