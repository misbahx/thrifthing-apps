import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/pages/edit_product_form.dart';
import 'package:thrifthing_app_kel4/services/Blocs/EditProduct/edit_product_bloc.dart';
import 'package:thrifthing_app_kel4/widget/error.dart';
import 'package:thrifthing_app_kel4/widget/loading.dart';

class EditProductMainState extends StatefulWidget {
  final int id;
  final String name, description, price, image;

  EditProductMainState({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  State<EditProductMainState> createState() => _EditProductMainStateState();
}

class _EditProductMainStateState extends State<EditProductMainState> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditProductBloc>().add(EditProductInitial());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductState>(
      builder: (context, state) {
        if (state is EditProductInitialState)
          return EditProductForm(
            id: widget.id,
            name: widget.name,
            description: widget.description,
            price: widget.price,
            image: widget.image,
          );
        if (state is LoadingEditProductState) return LoadingWidget();
        if (state is SuccessEditProductState) {
          return Scaffold(
            backgroundColor: Color(0xff0F172A),
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ), // Icon panah kembali
                onPressed: () => Navigator.of(context).pop("reload"),
              ),
              title: Text(
                "Edit Product",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xff0F172A),
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Product berhasil diedit.",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop("reload"),
                      child: Text("Kembali ke halaman sebelumnya"),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state is ErrorEditProductState)
          return ErrorNotif(message: state.error);
        return Container(
          child: Center(child: Text("State error")),
        );
      },
    );
  }
}
