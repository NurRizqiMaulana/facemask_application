import 'package:bloc/bloc.dart';
import 'package:facemask_application/data/datasources/auth_datasources.dart';
import 'package:meta/meta.dart';

part 'confirm_otp_event.dart';
part 'confirm_otp_state.dart';

class ConfirmOtpBloc extends Bloc<ConfirmOtpEvent, ConfirmOtpState> {
  final AuthDatasource authDatasource;
  ConfirmOtpBloc(this.authDatasource) : super(ConfirmOtpInitial()) {
    on<ConfirmOTP>((event, emit) async {
      // TODO: implement event handler
      emit(ConfirmOtpLoading());
      try {
        await authDatasource.confirmEmailOTP(event.otp);
        emit(ConfirmOtpSuccess("Email berhasil diganti"));
      } catch (e) {
        emit(ConfirmOtpFailure(e.toString()));
      }
    });
  }
}
