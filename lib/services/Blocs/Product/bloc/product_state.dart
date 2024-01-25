part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class AddProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class AddProductSuccessState extends ProductState {
  @override
  List<Object> get props => [];
}

class AddProductErrorState extends ProductState {
  final String error;
  AddProductErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
