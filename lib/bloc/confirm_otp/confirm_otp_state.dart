part of 'confirm_otp_bloc.dart';

@immutable
abstract class ConfirmOtpState {}

final class ConfirmOtpInitial extends ConfirmOtpState {}

final class ConfirmOtpLoading extends ConfirmOtpState {}

final class ConfirmOtpSuccess extends ConfirmOtpState {
  final String message;

  ConfirmOtpSuccess(this.message);
}

final class ConfirmOtpFailure extends ConfirmOtpState {
  final String error;

  ConfirmOtpFailure(this.error);
}
