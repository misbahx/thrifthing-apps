import 'dart:io';

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrifthing_app_kel4/repository/product_repository.dart';

part 'edit_product_event.dart';
part 'edit_product_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  ProductRepository productRepository;
  EditProductBloc({required this.productRepository})
      : super(EditProductInitialState()) {
    on<EditProductInitial>(_editProduct);
    on<ClickEditProductEvent>(_clickEditProduct);
  }

  _editProduct(EditProductInitial event, Emitter emit) async {
    emit(LoadingEditProductState());
    await Future.delayed(Duration(seconds: 1));
    emit(EditProductInitialState());
  }

  _clickEditProduct(ClickEditProductEvent event, Emitter emit) async {
    emit(LoadingEditProductState());

    try {
      Map res = await productRepository.editProduct(
        id: event.id,
        name: event.name,
        description: event.description,
        price: event.price,
        image: event.image,
      );
      log("Success edit, dan ini responnya: ${res}");
      emit(SuccessEditProductState(message: res['message']));
    } catch (err) {
      log("Gagal mengedit, dan ini errornya: ${err}");
      emit(ErrorEditProductState(error: err.toString()));
    }
  }
}
