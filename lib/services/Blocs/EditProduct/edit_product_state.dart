part of 'edit_product_bloc.dart';

sealed class EditProductState extends Equatable {
  const EditProductState();

  @override
  List<Object> get props => [];
}

final class EditProductInitialState extends EditProductState {
  @override
  List<Object> get props => [];
}

final class LoadingEditProductState extends EditProductState {
  @override
  List<Object> get props => [];
}

final class SuccessEditProductState extends EditProductState {
  final String message;
  SuccessEditProductState({required this.message});
  @override
  List<Object> get props => [message];
}

final class ErrorEditProductState extends EditProductState {
  final String error;
  ErrorEditProductState({required this.error});
  @override
  List<Object> get props => [];
}
