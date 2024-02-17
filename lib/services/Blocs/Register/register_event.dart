part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterInitialEvent extends RegisterEvent {
  @override
  List<Object> get props => [];
}

class ProsesRegister extends RegisterEvent {
  final String name;
  final String username;
  final String password;
  final String sessionToken;

  ProsesRegister({
    this.name = "",
    this.username = "",
    this.password = "",
    this.sessionToken = "",
  });

  @override
  List<Object> get props => [name, username, password, sessionToken];
}
