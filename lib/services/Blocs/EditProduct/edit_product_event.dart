part of 'edit_product_bloc.dart';

sealed class EditProductEvent extends Equatable {
  const EditProductEvent();

  @override
  List<Object?> get props => [];
}

final class EditProductInitial extends EditProductEvent {
  @override
  List<Object> get props => [];
}

final class ClickEditProductEvent extends EditProductEvent {
  final int id;
  final String name;
  final String description;
  final String price;
  final File? image;
  ClickEditProductEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
  });
  @override
  List<Object?> get props => [id, name, description, price, image];
}
