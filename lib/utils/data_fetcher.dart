import 'dart:convert';

import 'package:code_bangladesh_mobile_app/dto/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class DataFetcher {
  static final _categoryJson = 'https://codebangladesh.org/assets/generated/app-data.json';
  static final _httpClient = http.Client();
  static final AsyncMemoizer<AppDataResponseDTO> _memoizer = AsyncMemoizer<AppDataResponseDTO>();

  static Future<AppDataResponseDTO> fetch() {
    return _memoizer.runOnce(() async {
      final response = await _httpClient.get(Uri.parse(_categoryJson));
      print("fetched data !!!!");
      if (response.statusCode == 200) {
        return AppDataResponseDTO.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load app data.');
      }
    });
  }
}
