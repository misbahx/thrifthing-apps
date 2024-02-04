part of 'detail_product_bloc.dart';

sealed class DetailProductState extends Equatable {
  const DetailProductState();

  @override
  List<Object> get props => [];
}

final class DetailProductInitial extends DetailProductState {
  @override
  List<Object> get props => [];
}

final class LoadingDetailProductState extends DetailProductState {
  @override
  List<Object> get props => [];
}

final class FailedLoadingDetailProductState extends DetailProductState {
  String error;
  FailedLoadingDetailProductState({required this.error});
  @override
  List<Object> get props => [error];
}

final class DeleteProductState extends DetailProductState {
  final String title;
  DeleteProductState({required this.title});
  @override
  List<Object> get props => [title];
}
