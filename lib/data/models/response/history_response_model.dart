import 'dart:convert';
import 'package:intl/intl.dart';

// Fungsi untuk mengonversi JSON string menjadi objek HistoryResponseModel
HistoryResponseModel historyResponseModelFromJson(String str) =>
    HistoryResponseModel.fromJson(json.decode(str));

// Fungsi untuk mengonversi objek HistoryResponseModel menjadi JSON string
String historyResponseModelToJson(HistoryResponseModel data) =>
    json.encode(data.toJson());

class HistoryResponseModel {
  final String historyResponseModelClass;
  final DateTime date;
  final String day;
  final String direction;

  HistoryResponseModel({
    required this.historyResponseModelClass,
    required this.date,
    required this.day,
    required this.direction,
  });

  // Factory method untuk membuat instance dari JSON map
  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) {
    DateTime parsedDate;

    // Coba parsing dengan beberapa format yang berbeda
    try {
      // Format RFC 1123 seperti "Mon, 10 Jun 2024 00:00:00 GMT"
      final DateFormat rfc1123Format =
          DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", 'en_US');
      parsedDate = rfc1123Format.parseUTC(json["date"]);
    } catch (e) {
      // Jika gagal, coba format ISO 8601
      try {
        parsedDate = DateTime.parse(json["date"]);
      } catch (e) {
        // Jika kedua parsing gagal, lempar kesalahan
        throw FormatException("Format tanggal tidak valid: ${json["date"]}");
      }
    }

    return HistoryResponseModel(
      historyResponseModelClass: json["class"],
      date: parsedDate,
      day: json["day"],
      direction: json["direction"],
    );
  }

  // Method untuk mengonversi objek ke map JSON
  Map<String, dynamic> toJson() => {
        "class": historyResponseModelClass,
        "date":
            date.toIso8601String(), // Menyimpan tanggal dalam format ISO 8601
        "day": day,
        "direction": direction,
      };
}
