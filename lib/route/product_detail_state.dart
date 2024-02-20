import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/pages/product.dart';
import 'package:thrifthing_app_kel4/services/Blocs/DetailProduct/detail_product_bloc.dart';
import 'package:thrifthing_app_kel4/widget/error.dart';
import 'package:thrifthing_app_kel4/widget/loading.dart';

class ProductDetailMainState extends StatefulWidget {
  final int id;

  ProductDetailMainState({required this.id});

  @override
  _ProductDetailMainStateState createState() => _ProductDetailMainStateState();
}

class _ProductDetailMainStateState extends State<ProductDetailMainState> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DetailProductBloc>()
          .add(LoadDetailProductEvent(id: widget.id));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailProductBloc, DetailProductState>(
      builder: (context, state) {
        if (state is DetailProductInitial) {
          return ProductPage(
            id: state.product['id'],
            name: state.product['name'],
            price: state.product['price'],
            description: state.product['description'],
            image: state.product['image'],
          );
        }
        if (state is LoadingDetailProductState) {
          return LoadingWidget();
        }
        if (state is DeleteProductState) {
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
                "Hapus sukses",
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
                    "Product ${state.title} berhasil dihapus.",
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
        if (state is FailedLoadingDetailProductState) {
          return ErrorNotif(message: state.error);
        }
        return Container(
          child: Center(child: Text("State error")),
        );
      },
    );
  }
}
