import 'dart:convert';

class ArtikelResponseModel {
  int id;
  String judul;
  String konten;

  ArtikelResponseModel({
    required this.id,
    required this.judul,
    required this.konten,
  });

  factory ArtikelResponseModel.fromRawJson(String str) =>
      ArtikelResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArtikelResponseModel.fromJson(Map<String, dynamic> json) =>
      ArtikelResponseModel(
        id: json["id"],
        judul: json["judul"],
        konten: json["konten"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "konten": konten,
      };
}
