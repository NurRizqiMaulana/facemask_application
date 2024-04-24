import 'package:facemask_application/data/models/requests/login_model.dart';
import 'package:facemask_application/data/models/response/login_response_model.dart';

import '../models/requests/register_model.dart';
import '../models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('https://c705-103-121-122-197.ngrok-free.app/signin'),
      body: registerModel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }

  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse('https://c705-103-121-122-197.ngrok-free.app/signin'),
      body: loginModel.toMap(),
    );

    final result = LoginResponseModel.fromJson(response.body);
    return result;
  }

  // Future<ProfileResponseModel> getProfile() async {
  //   final token = await AuthLocalStorage().getToken();
  //   var headers = {'Authorization': 'Bearer $token'};
  //   final response = await http.get(
  //     Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
  //     headers: headers,
  //   );

  //   final result = ProfileResponseModel.fromJson(response.body);
  //   return result;
  // }
}
