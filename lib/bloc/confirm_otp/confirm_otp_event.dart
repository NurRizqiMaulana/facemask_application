part of 'confirm_otp_bloc.dart';

@immutable
abstract class ConfirmOtpEvent {}

class ConfirmOTP extends ConfirmOtpEvent {
  final String otp;

  ConfirmOTP({required this.otp});
}
