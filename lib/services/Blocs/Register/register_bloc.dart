import "dart:developer";
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrifthing_app_kel4/repository/login_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  LoginRepository loginRepository;
  RegisterBloc({required this.loginRepository}) : super(RegisterInitial()) {
    on<RegisterInitialEvent>(_registerInitial);
    on<ProsesRegister>(_prosesRegister);
  }
  _registerInitial(RegisterInitialEvent event, Emitter emit) async {
    emit(RegisterLoading());
    await Future.delayed(Duration(seconds: 1));
    emit(RegisterInitial());
  }

  _prosesRegister(ProsesRegister event, Emitter emit) async {
    String name = event.name;
    String username = event.username;
    String password = event.password;
    String sessionToken = event.sessionToken;

    emit(RegisterLoading());

    try {
      Map res = await loginRepository.register(
        name: name,
        username: username,
        password: password,
        sessionToken: sessionToken,
      );
      log('Proses Register Bloc response ${res}');

      if (res['status'] == 200) {
        emit(RegisterSuccess(message: res['message']));
      } else {
        emit(RegisterFailed(error: "User sudah tersedia"));
      }
    } catch (err) {
      log("Error Proses Register Bloc ${err}");
    }
  }
}
