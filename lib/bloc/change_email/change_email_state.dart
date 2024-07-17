part of 'change_email_bloc.dart';

@immutable
abstract class ChangeEmailState {}

final class ChangeEmailInitial extends ChangeEmailState {}

final class ChangeEmailLoading extends ChangeEmailState {}

final class ChangeEmailSuccess extends ChangeEmailState {
  final String message;

  ChangeEmailSuccess(this.message);
}

final class ChangeEmailFaulure extends ChangeEmailState {
  final String error;

  ChangeEmailFaulure(this.error);
}
