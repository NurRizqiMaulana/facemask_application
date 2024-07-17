import 'dart:convert';

class EmailModel {
  final String new_email;
  final String otp;

  EmailModel({required this.new_email, required this.otp});

  Map<String, dynamic> toMap() {
    return {
      'new_email': new_email,
      'otp': otp,
    };
  }

  factory EmailModel.fromMap(Map<String, dynamic> map) {
    return EmailModel(
      new_email: map['new_email'] ?? '',
      otp: map['otp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EmailModel.fromJson(String source) =>
      EmailModel.fromMap(json.decode(source));
}
