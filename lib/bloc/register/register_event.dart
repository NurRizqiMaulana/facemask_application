import 'package:facemask_application/data/models/requests/register_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterEvent {}

class SaveRegisterEvent extends RegisterEvent {
  final RegisterModel registerModel;

  SaveRegisterEvent({required this.registerModel});
}
