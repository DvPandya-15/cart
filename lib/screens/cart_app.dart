import 'package:cart/model/product.dart';
import 'package:cart/screens/cart_screen.dart';
import 'package:cart/screens/product_screen.dart';
import 'package:flutter/material.dart';

class CartApp extends StatefulWidget {
  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<Product> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart App"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct) {
              setState(
                () {
                  cart.add(selectedProduct);
                  sum = 0;
                  cart.forEach(
                    (item) {
                      sum = sum + item.price!;
                    },
                  );
                },
              );
            }),
            CartScreen(cart, sum),
          ],
        ),
      ),
    );
  }
}
