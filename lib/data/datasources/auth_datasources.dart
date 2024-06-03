import 'dart:convert';
import 'dart:io';

import 'package:facemask_application/data/localsources/auth_local_storage.dart';
import 'package:facemask_application/data/models/requests/login_model.dart';
import 'package:facemask_application/data/models/requests/password_model.dart';
import 'package:facemask_application/data/models/response/edit_profil_response_model.dart';
import 'package:facemask_application/data/models/response/login_response_model.dart';
import 'package:facemask_application/data/models/response/profil_response_mode.dart';
import 'package:http/http.dart';

import '../models/requests/register_model.dart';
import '../models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  final baseUrl = 'http://192.168.229.85:5000';

  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: registerModel.toMap(),
    );

    if (response.statusCode == 201) {
      final result = RegisterResponseModel.fromJson(response.body);
      return result;
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['message']);
    }
  }

  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: loginModel.toMap(),
    );

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['message']);
    }
  }

  Future<ProfileResponseModel> getProfile() async {
    final token = await AuthLocalStorage().getToken();
    var headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(
      Uri.parse('$baseUrl/protected'),
      headers: headers,
    );

    final result = ProfileResponseModel.fromJson(response.body);
    return result;
  }

  Future<EditProfileResponseModel> editProfile({
    File? avatar,
    String? name,
    String? email,
  }) async {
    final token = await AuthLocalStorage().getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      // 'Content-Type': 'multipart/form-data',
    };

    var request = MultipartRequest('PUT', Uri.parse('$baseUrl/edit_profile'));
    request.headers.addAll(headers);

    request.fields['name'] = name!;
    request.fields['email'] = email!;

    if (avatar != null) {
      request.files.add(await MultipartFile.fromPath('file', avatar.path));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final result = EditProfileResponseModel.fromJson(responseBody);
      return result;
    } else {
      throw Exception('Failed to update profile');
    }
  }

  Future<EditProfileResponseModel> changePassword(
      PasswordModel passwordModel) async {
    final token = await AuthLocalStorage().getToken();
    final response = await http.put(
      Uri.parse('$baseUrl/change_password'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: passwordModel.toMap(),
    );

    if (response.statusCode == 200) {
      final result = EditProfileResponseModel.fromJson(response.body);
      return result;
    } else {
      throw Exception('current password is wrong!');
    }
  }

  Future<void> resetPasswordRequest(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reset_password_request'),
      body: {'email': email},
    );

    if (response.statusCode != 200) {
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['message']);
    }
  }

  Future<void> resetPasswordConfirm(
      String token, String newPassword, String confirmPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reset_password/$token'),
      body: {
        'new_password': newPassword,
        'confirm_password': confirmPassword,
      },
    );

    if (response.statusCode != 200) {
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['message']);
    }
  }
}
