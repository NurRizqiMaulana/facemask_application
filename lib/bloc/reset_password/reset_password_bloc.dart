import 'package:bloc/bloc.dart';
import 'package:facemask_application/data/datasources/auth_datasources.dart';
import 'package:meta/meta.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthDatasource authDatasource;
  ResetPasswordBloc(this.authDatasource) : super(ResetPasswordInitial()) {
    on<ResetPasswordRequest>(
      (event, emit) async {
        emit(ResetPasswordLoading());
        try {
          await authDatasource.resetPasswordRequest(event.email);
          emit(ResetPasswordSuccess(
              "Silakan cek email untuk mengatur ulang kata sandi Anda."));
        } catch (e) {
          emit(ResetPasswordFailure(e.toString()));
        }
      },
    );
    on<ResetPasswordConfirm>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        await authDatasource.resetPasswordConfirm(
            event.token, event.newPassword, event.confirmPassword);
        emit(ResetPasswordSuccess("Password berhasil diatur ulang."));
      } catch (e) {
        emit(ResetPasswordFailure(e.toString()));
      }
    });
  }
}
