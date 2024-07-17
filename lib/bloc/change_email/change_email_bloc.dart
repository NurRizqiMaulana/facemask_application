import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/datasources/auth_datasources.dart';

part 'change_email_event.dart';
part 'change_email_state.dart';

class ChangeEmailBloc extends Bloc<ChangeEmailEvent, ChangeEmailState> {
  final AuthDatasource authDatasource;

  ChangeEmailBloc(this.authDatasource) : super(ChangeEmailInitial()) {
    on<ChangeEmail>((event, emit) async {
      emit(ChangeEmailLoading());
      try {
        await authDatasource.changeEmailRequest(event.email);
        emit(
            ChangeEmailSuccess("Silakan cek email, Kode otp berhasil dikirim"));
      } catch (e) {
        emit(ChangeEmailFaulure(e.toString()));
      }
    });
  }
}
