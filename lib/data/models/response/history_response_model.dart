// import 'dart:convert';

// class HistoryResponseModel {
//   String? id;
//   String? historyResponseModelClass;
//   String? date;
//   String? direction;
//   String? timestamp;

//   HistoryResponseModel({
//     this.id,
//     this.historyResponseModelClass,
//     this.date,
//     this.direction,
//     this.timestamp,
//   });

//   factory HistoryResponseModel.fromJson(String str) =>
//       HistoryResponseModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory HistoryResponseModel.fromMap(Map<String, dynamic> json) =>
//       HistoryResponseModel(
//         id: json["_id"],
//         historyResponseModelClass: json["class"],
//         date: json["date"],
//         direction: json["direction"],
//         timestamp: json["timestamp"],
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "class": historyResponseModelClass,
//         "date": date,
//         "direction": direction,
//         "timestamp": timestamp,
//       };
// }

// lib/models/history_data.dart
import 'package:intl/intl.dart';

class HistoryResponseModel {
  final String id;
  final String className;
  final String date;
  final String direction;
  final DateTime timestamp;

  HistoryResponseModel({
    required this.id,
    required this.className,
    required this.date,
    required this.direction,
    required this.timestamp,
  });

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) {
    // Format yang digunakan untuk parsing tanggal
    final DateFormat formatter =
        DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", 'en_US');

    return HistoryResponseModel(
      id: json['_id'],
      className: json['class'],
      date: json['date'],
      direction: json['direction'],
      timestamp: formatter.parseUTC(json['timestamp']), // Parsing tanggal
    );
  }
}
