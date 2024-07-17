part of 'change_email_bloc.dart';

@immutable
abstract class ChangeEmailEvent {}

class ChangeEmail extends ChangeEmailEvent {
  final String email;

  ChangeEmail({required this.email});
}
