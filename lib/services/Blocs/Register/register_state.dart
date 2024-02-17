part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

class RegisterFailed extends RegisterState {
  final String error;
  RegisterFailed({required this.error});
  @override
  List<Object> get props => [error];
}
