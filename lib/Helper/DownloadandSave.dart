import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:gohar_shahi/Helper/lauchUrl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class PDFResult {
  final String? path; // for mobile
  final Uint8List? bytes; // for web

  PDFResult({this.path, this.bytes});
}

class PDFManager {
  static Future<PDFResult?> downloadPDF({
    required String url,
    required String fileName,
    void Function(int received, int total)? onProgress,
  }) async {
    try {
      if (!url.startsWith('http')) {
        throw Exception('Invalid URL: Must start with http/https');
      }

      if (kIsWeb) {
        openLinK(url);
        
        // On web, download bytes and return
        final Dio dio = Dio();
        final response = await dio.getUri(
          Uri.parse(url),
          // options: Options(responseType: ResponseType.bytes),
          onReceiveProgress: onProgress,
        );
        debugPrint(response.toString());
        final bytes = Uint8List.fromList(response.data);
        return PDFResult(bytes: bytes);
      }

      // On mobile, download to file
      final Directory dir = await getApplicationDocumentsDirectory();
      final String filePath = '${dir.path}/$fileName';
      final File file = File(filePath);

      if (await file.exists()) {
        return PDFResult(path: filePath);
      }

      final Dio dio = Dio();
      final response = await dio.download(
        url,
        filePath,
        onReceiveProgress: onProgress,
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to download file: HTTP ${response.statusCode}');
      }

      return PDFResult(path: filePath);
    } catch (e) {
      debugPrint("Error downloading PDF: $e");
      rethrow;
    }
  }
}
