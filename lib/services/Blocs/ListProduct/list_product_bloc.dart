import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrifthing_app_kel4/repository/product_repository.dart';

part 'list_product_event.dart';
part 'list_product_state.dart';

class ListProductBloc extends Bloc<ListProductEvent, ListProductState> {
  ProductRepository productRepository;
  ListProductBloc({required this.productRepository})
      : super(ListProductLoading()) {
    on<TampilProduct>(_tampilProduct);
  }

  _tampilProduct(TampilProduct event, Emitter emit) async {
    String key = event.keyword;
    emit(ListProductLoading());
    try {
      final res = await productRepository.getListProduct(key);
      emit(ListProductInitial(product: res));
    } catch (err) {
      log("Error tampil Product Bloc: ${err}");
    }
  }
}
