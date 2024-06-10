import 'dart:convert';

import 'package:facemask_application/data/models/response/artikel_response_model.dart';
import 'package:facemask_application/data/models/response/history_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/requests/detection_model.dart';

class ArtikelDatasources {
  final baseUrl = 'http://192.168.37.85:5000';

  Future<List<ArtikelResponseModel>> fetchArtikels() async {
    final response = await http.get(Uri.parse('$baseUrl/artikel'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => ArtikelResponseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load artikels');
    }
  }

  Future<List<DetectionResponseModel>> fetchDetections() async {
    final response = await http.get(Uri.parse('$baseUrl/detection_data'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['detections'];
      return body.map((json) => DetectionResponseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load detections');
    }
  }

  Future<List<DetectionCountResponseModel>> fetchDetectionCounts() async {
    final response = await http.get(Uri.parse('$baseUrl/detection_data'));
    if (response.statusCode == 200) {
      Map<String, dynamic> countData = json.decode(response.body)['count_data'];
      return countData.entries
          .map((entry) =>
              DetectionCountResponseModel.fromJson(entry.key, entry.value))
          .toList();
    } else {
      throw Exception('Failed to load detection counts');
    }
  }
}
