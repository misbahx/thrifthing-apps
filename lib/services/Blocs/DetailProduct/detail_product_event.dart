part of 'detail_product_bloc.dart';

sealed class DetailProductEvent extends Equatable {
  const DetailProductEvent();

  @override
  List<Object> get props => [];
}

final class LoadDetailProductEvent extends DetailProductEvent {
  @override
  List<Object> get props => [];
}

final class DeleteProductEvent extends DetailProductEvent {
  int productId;
  String title;

  DeleteProductEvent({required this.productId, required this.title});

  @override
  List<Object> get props => [productId, title];
}
