import 'dart:convert';

class ErorResponseModel {
  final String message;
  // final String refreshToken;
  ErorResponseModel({
    required this.message,
    // required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      // 'refreshToken': refreshToken,
    };
  }

  factory ErorResponseModel.fromMap(Map<String, dynamic> map) {
    return ErorResponseModel(
      message: map['message'] ?? '',
      // refreshToken: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ErorResponseModel.fromJson(String source) =>
      ErorResponseModel.fromMap(json.decode(source));
}
