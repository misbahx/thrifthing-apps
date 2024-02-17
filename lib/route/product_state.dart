import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/pages/add_product_form.dart';
import 'package:thrifthing_app_kel4/services/Blocs/Product/product_bloc.dart';
import 'package:thrifthing_app_kel4/widget/error.dart';
import 'package:thrifthing_app_kel4/widget/loading.dart';

class ProductMainState extends StatelessWidget {
  const ProductMainState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is AddProductInitial) return AddProductForm();
        if (state is AddProductLoadingState) return LoadingWidget();
        if (state is AddProductSuccessState) return AddProductForm();
        if (state is AddProductErrorState)
          return ErrorNotif(message: state.error);
        return Container(
          child: Center(child: Text("State error")),
        );
      },
    );
  }
}
