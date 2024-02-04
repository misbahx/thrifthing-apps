import 'dart:io';

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrifthing_app_kel4/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(AddProductInitial()) {
    on<ProductInitialEvent>(_prodictInitialEvent);
    on<ClickAddProductEvent>(_clickAddProductEvent);
  }

  _prodictInitialEvent(ProductInitialEvent event, Emitter emit) async {
    emit(AddProductLoadingState());
    emit(AddProductInitial());
  }

  _clickAddProductEvent(ClickAddProductEvent event, Emitter emit) async {
    emit(AddProductLoadingState());

    try {
      log('success create data');
      await productRepository.addProduct(
        name: event.name,
        description: event.description,
        price: event.price,
        image: event.image,
      );
      emit(AddProductSuccessState());
      await Future.delayed(Duration(seconds: 3));
      emit(AddProductInitial());
    } catch (err) {
      log('Error product bloc(ClickAddProductEvent): ${err}');
      emit(AddProductErrorState(error: err.toString()));
    }
  }
}
