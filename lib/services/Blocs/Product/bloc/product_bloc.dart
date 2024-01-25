import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrifthing_app_kel4/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<ProductInitialEvent>(_prodictInitialEvent);
    on<ClickAddProduct>(_addProductEvent);
  }

  _prodictInitialEvent(ProductInitialEvent event, Emitter emit) async {}

  _addProductEvent(ClickAddProduct event, Emitter emit) async {}
}
