import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrifthing_app_kel4/repository/product_repository.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  ProductRepository productRepository;
  DetailProductBloc({required this.productRepository})
      : super(LoadingDetailProductState()) {
    on<LoadDetailProductEvent>(_loadDetailProductEvent);
    on<DeleteProductEvent>(_deleteProductEvent);
  }

  _loadDetailProductEvent(LoadDetailProductEvent event, Emitter emit) async {
    emit(LoadingDetailProductState());
    await Future.delayed(Duration(seconds: 1));
    emit(DetailProductInitial());
  }

  _deleteProductEvent(DeleteProductEvent event, Emitter emit) async {
    int productId = event.productId;
    String title = event.title;
    try {
      String res = await productRepository.deleteProduct(productId);
      log("Success delete, dan ini responnya: ${res}");
      emit(DeleteProductState(title: title));
    } catch (err) {
      log("Gagal menghapus, dan ini errornya: ${err}");
    }
  }
}
