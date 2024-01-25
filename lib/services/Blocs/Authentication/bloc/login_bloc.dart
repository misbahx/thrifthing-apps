import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrifthing_app_kel4/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginInitialEvent>(_initialEvent);
    on<ProsesLogin>(_prosesLoginEvent);
    on<ProsesLogout>(_prosesLogoutEvent);
  }

  _initialEvent(LoginInitialEvent event, Emitter emit) async {
    emit(LoginLoading());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String sessionToken = preferences.getString("session") ?? "";

    if (sessionToken == "") {
      emit(LoginInitial());
    } else {
      bool result = await loginRepository.checkSession(sessionToken);
      if (result) {
        emit(LoginSuccess(session: sessionToken));
      } else {
        emit(LoginFailed(error: "Login failed"));
        emit(LoginInitial());
      }
    }
  }

  _prosesLoginEvent(ProsesLogin event, Emitter emit) async {
    // ambil username & password
    String username = event.username;
    String password = event.password;

    // jalakan state logout
    emit(LoginLoading());

    // logic login
    Map res =
        await loginRepository.login(username: username, password: password);
    if (res['status']) {
      emit(LoginSuccess(session: res['data']['session_token']));
    } else {
      emit(LoginFailed(error: "Wrong username or password"));
    }
  }

  _prosesLogoutEvent(ProsesLogout event, Emitter emit) async {
    emit(LoginLoading());
    try {
      await loginRepository.logout();
    } catch (err) {
      log("Error ${err}");
    }
    emit(LoginInitial());
  }
}
