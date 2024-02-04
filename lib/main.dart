import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:thrifthing_app_kel4/pages/main_state.dart';
import "package:thrifthing_app_kel4/repository/login_repository.dart";
import "package:thrifthing_app_kel4/repository/product_repository.dart";
import "package:thrifthing_app_kel4/services/Blocs/Authentication/login_bloc.dart";
import "package:thrifthing_app_kel4/services/Blocs/DetailProduct/detail_product_bloc.dart";
import "package:thrifthing_app_kel4/services/Blocs/EditProduct/edit_product_bloc.dart";
import "package:thrifthing_app_kel4/services/Blocs/ListProduct/list_product_bloc.dart";
import "package:thrifthing_app_kel4/services/Blocs/Product/product_bloc.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => LoginRepository()),
          RepositoryProvider(create: (context) => ProductRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            // login bloc provider
            BlocProvider(
              create: ((context) =>
                  LoginBloc(loginRepository: context.read<LoginRepository>())
                    ..add(
                      LoginInitialEvent(),
                    )),
            ),

            // product bloc provider
            BlocProvider(
              create: ((context) => ProductBloc(
                  productRepository: context.read<ProductRepository>())
                ..add(
                  ProductInitialEvent(),
                )),
            ),

            // list product bloc provider
            BlocProvider(
              create: ((context) => ListProductBloc(
                  productRepository: context.read<ProductRepository>())
                ..add(
                  TampilProduct(),
                )),
            ),

            // product detail bloc provider
            BlocProvider(
              create: ((context) => DetailProductBloc(
                  productRepository: context.read<ProductRepository>())),
            ),

            // product detail bloc provider
            BlocProvider(
              create: ((context) => EditProductBloc(
                  productRepository: context.read<ProductRepository>())),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Quicksand'),
            title: "Thrifthing apps",
            home: MainState(),
          ),
        ));
  }
}
