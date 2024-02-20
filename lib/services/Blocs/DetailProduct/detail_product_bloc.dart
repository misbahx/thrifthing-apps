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
    final int id = event.id;
    try {
      emit(LoadingDetailProductState());

      Map res = await productRepository.getProductById(id);
      log("response detail product bloc: ${res}");
      if (res.isNotEmpty) {
        emit(DetailProductInitial(product: res));
      } else {
        emit(FailedLoadingDetailProductState(error: "Product not loaded"));
      }
    } catch (err) {
      log("Catch error detail product bloc : ${err}");
    }
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
