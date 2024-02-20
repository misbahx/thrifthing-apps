import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrifthing_app_kel4/route/edit_state.dart';
import 'package:thrifthing_app_kel4/services/Blocs/DetailProduct/detail_product_bloc.dart';

class ProductPage extends StatelessWidget {
  final int id;
  final String name, price, description, image;

  ProductPage({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0F172A),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                      color: Color(0xff0F172A),
                      image: DecorationImage(image: NetworkImage(this.image))),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 22,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.favorite,
                              size: 22,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                this.name,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Rp. ${this.price}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // Rating Bar
                      RatingBar.builder(
                          unratedColor: Color.fromARGB(255, 223, 221, 221),
                          itemSize: 28,
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                          onRatingUpdate: (rating) {}),

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        this.description,
                        style: TextStyle(
                            fontSize: 16, color: Colors.white.withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<DetailProductBloc>().add(
                                    DeleteProductEvent(
                                      productId: this.id,
                                      title: this.name,
                                    ),
                                  );
                            },
                            child: Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  color: Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                CupertinoIcons.delete,
                                size: 22,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProductMainState(
                                    id: this.id,
                                    name: this.name,
                                    description: this.description,
                                    price: this.price,
                                    image: this.image,
                                  ),
                                ),
                              ).then((value) {
                                if (value == 'reload') {
                                  context
                                      .read<DetailProductBloc>()
                                      .add(LoadDetailProductEvent(id: this.id));
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 70),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
