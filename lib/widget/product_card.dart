import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/route/product_detail_state.dart';
import 'package:thrifthing_app_kel4/services/Blocs/ListProduct/list_product_bloc.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailMainState(
                            id: this.product['id'],
                          ),
                        ),
                      ).then(
                        (value) => {
                          if (value == "reload")
                            {
                              context
                                  .read<ListProductBloc>()
                                  .add(TampilProduct()),
                            }
                        },
                      );
                    },
                    child: Image.network(
                      this.product["image"],
                      fit: BoxFit.cover,
                      height: 230,
                    )),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xfff7f8fa),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.product["name"],
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Rp. ${this.product["price"]}",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7)),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
