import 'dart:convert';

import '../models/response/history_response_model.dart';
import 'package:http/http.dart' as http;

class HistoryDatasources {
  final baseUrl = 'http://192.168.163.85:5000';

  Future<List<HistoryResponseModel>> fetchHistory() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/history'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData
            .map((item) => HistoryResponseModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Gagal memuat data dari server');
      }
    } catch (e) {
      print(e);
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
