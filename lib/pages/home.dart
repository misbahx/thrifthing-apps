import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrifthing_app_kel4/pages/about.dart';
import 'package:thrifthing_app_kel4/pages/product_state.dart';
import 'package:thrifthing_app_kel4/services/Blocs/Authentication/login_bloc.dart';
import 'package:thrifthing_app_kel4/widget/product_card.dart';

class HomePage extends StatelessWidget {
  List product;
  HomePage({required this.product});
  List cartList = ["All", "Best Selling", "Jackets", "Shirts", "Pants", "Bags"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F172A),
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
                          color: Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text(
                              "Find your product",
                              style: TextStyle(color: Colors.white),
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search,
                                size: 30, color: Colors.grey)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF1E293B),
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
                    "assets/images/banner-rev1.png",
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
                                  ? Color(0xff4338CA)
                                  : Color(0xff1E293B),
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
              SizedBox(
                height: 25,
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
                itemCount: this.product.length,
                itemBuilder: (_, idx) {
                  return ProductCard(product: this.product[idx]);
                },
              )
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1E293B),
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
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductMainState()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'About'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff4338CA),
        child: Icon(
          Icons.camera,
          color: Colors.grey,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
