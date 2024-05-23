part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  // final String name;
  // final String email;
  final File? avatar;

  EditProfileEvent({
    // required this.name,
    // required this.email,
    this.avatar,
  });
}
