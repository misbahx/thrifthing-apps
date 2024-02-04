part of 'list_product_bloc.dart';

sealed class ListProductEvent extends Equatable {
  const ListProductEvent();

  @override
  List<Object> get props => [];
}

final class TampilProduct extends ListProductEvent {
  final String keyword;

  TampilProduct({this.keyword = ""});

  @override
  List<Object> get props => [];
}
