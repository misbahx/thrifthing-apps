part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductInitialEvent extends ProductEvent {
  @override
  List<Object> get props => [];
}

class ClickAddProduct extends ProductEvent {
  final String name;
  final String description;
  final String price;
  final File image;

  ClickAddProduct({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  List<Object> get props => [name, description, price, image];
}
