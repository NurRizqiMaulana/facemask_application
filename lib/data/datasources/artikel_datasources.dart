import 'dart:convert';

import 'package:facemask_application/data/models/response/artikel_response_model.dart';
import 'package:http/http.dart' as http;

class ArtikelDatasources {
  final baseUrl = 'http://192.168.229.85:5000';

  // Future<List<ArtikelResponseModel>> getAllProduct() async {
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/artikel'),
  //   );

  //   final result = List<ArtikelResponseModel>.from(jsonDecode(response.body)
  //       .map((x) => ArtikelResponseModel.fromJson(x))).toList();
  //   return result;
  // }

  Future<List<ArtikelResponseModel>> fetchArtikels() async {
    final response = await http.get(Uri.parse('$baseUrl/artikel'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => ArtikelResponseModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load artikels');
    }
  }
}
