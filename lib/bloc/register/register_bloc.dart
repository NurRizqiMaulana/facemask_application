import 'package:facemask_application/bloc/register/register_event.dart';
import 'package:facemask_application/bloc/register/register_state.dart';
import 'package:facemask_application/data/datasources/auth_datasources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasource datasource;
  RegisterBloc(this.datasource) : super(RegisterInitial()) {
    on<SaveRegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        final result = await datasource.register(event.registerModel);
        print(result);
        emit(RegisterLoaded(registerResponseModel: result));
      } catch (e) {
        emit(RegisterError(message: e.toString()));
      }
    });
  }
}
