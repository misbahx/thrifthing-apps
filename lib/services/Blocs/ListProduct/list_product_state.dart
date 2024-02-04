part of 'list_product_bloc.dart';

sealed class ListProductState extends Equatable {
  const ListProductState();

  @override
  List<Object> get props => [];
}

final class ListProductInitial extends ListProductState {
  final List product;
  final String searchText;

  ListProductInitial({required this.product, this.searchText = ""});

  @override
  List<Object> get props => [product];
}

final class ListProductLoading extends ListProductState {
  @override
  List<Object> get props => [];
}
