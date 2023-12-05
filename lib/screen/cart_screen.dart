import 'package:flutter/material.dart';
import 'package:thrifthing_app_kel4/widget/cart_item_sample.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                    ),
                  ),
                  Text("Cart",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.more_horiz,
                      size: 22,
                    ),
                  )
                ],
              )),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                CartItemSamples(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select All",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Checkbox(
                          activeColor: Color(0xff63663C),
                          value: true,
                          onChanged: (value) => {})
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Const",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                      Text(
                        "\$900.54",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment: ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$300.54",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                    decoration: BoxDecoration(
                        color: Color(0xff63663C),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white.withOpacity(0.9)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    ));
  }
}
