part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  String session;

  LoginSuccess({required this.session});

  @override
  List<Object> get props => [session];
}

class LoginFailed extends LoginState {
  String error;

  LoginFailed({required this.error});

  @override
  List<Object> get props => [error];
}
