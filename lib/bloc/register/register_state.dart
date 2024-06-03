import 'package:facemask_application/data/models/response/register_response_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final RegisterResponseModel registerResponseModel;

  RegisterLoaded({required this.registerResponseModel});
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
}
