part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class ResetPasswordRequest extends ResetPasswordEvent {
  final String email;

  ResetPasswordRequest({required this.email});
}

class ResetPasswordConfirm extends ResetPasswordEvent {
  final String token;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordConfirm(this.token, this.newPassword, this.confirmPassword);
}
