import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/pages/about.dart';
import 'package:thrifthing_app_kel4/pages/cart.dart';
import 'package:thrifthing_app_kel4/services/Blocs/Authentication/bloc/login_bloc.dart';
import 'package:thrifthing_app_kel4/widget/product_card.dart';

class HomeScreen extends StatelessWidget {
  List cartList = ["All", "Best Selling", "Jackets", "Shirts", "Pants", "Bags"];
  List imgList = [
    "Black T-Shirt",
    "Cardigan Rajut",
    "Jacket Boom",
    "Jacket Coldplay",
    "Outfit Cewe 1",
    "Outfit Cewe 2",
    "Outfit Cewe 3",
    "Outfit Cowo",
    "Swater Lines",
    "Swater Pink",
    "Sweater Green",
    "Sweater Grey",
    "Sweater Shirt",
    "Sweater White",
    "T-Shirt"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 20, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F8Fa),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text("Find your product"),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search,
                                size: 30, color: Colors.grey)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F8Fa),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.notifications_none,
                          size: 30, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 25, top: 20),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "images/banner-rev1.png",
                    width: MediaQuery.of(context).size.width / 1.2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(children: [
                    for (int i = 0; i < cartList.length; i++)
                      Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          decoration: BoxDecoration(
                              color: cartList[i] == "All"
                                  ? Color(0xff63663C)
                                  : Color(0xfff7f8fa),
                              borderRadius: BorderRadius.circular(18)),
                          child: Text(
                            cartList[i],
                            style: TextStyle(
                                fontSize: 16,
                                color: cartList[i] == 'All'
                                    ? Colors.white
                                    : Colors.grey),
                          )),
                  ]),
                ),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width - 30 - 25) /
                              (2 * 290),
                      mainAxisSpacing: 45,
                      crossAxisSpacing: 15),
                  itemCount: imgList.length,
                  itemBuilder: (_, idx) {
                    if (idx % 2 == 0) {
                      return ProductCard(imgList[idx]);
                    }
                    return OverflowBox(
                      maxHeight: 290.0 + 70.0,
                      child: Container(
                        margin: EdgeInsets.only(top: 70),
                        child: ProductCard(imgList[idx]),
                      ),
                    );
                  })
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[700],
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 3) {
            BlocProvider.of<LoginBloc>(context).add(
              ProsesLogout(),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart_fill), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffC18640),
        child: Icon(Icons.camera),
        onPressed: () {},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
