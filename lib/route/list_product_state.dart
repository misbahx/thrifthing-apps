import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/pages/home.dart';
import 'package:thrifthing_app_kel4/services/Blocs/ListProduct/list_product_bloc.dart';
import 'package:thrifthing_app_kel4/widget/loading.dart';

class ListProductMainState extends StatelessWidget {
  const ListProductMainState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListProductBloc, ListProductState>(
      builder: (context, state) {
        if (state is ListProductLoading) return LoadingWidget();
        if (state is ListProductInitial)
          return HomePage(product: state.product);
        return Container(
          child: Center(child: Text("State error")),
        );
      },
    );
  }
}
