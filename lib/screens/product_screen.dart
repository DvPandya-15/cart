import 'package:cart/model/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final ValueSetter<Product> _productSetter;
  ProductScreen(this._productSetter);

  List<Product> products = [
    Product("Mic", 50),
    Product("LED Monitor", 100),
    Product("Mouse", 5),
    Product("Keyboard", 10),
    Product("Speaker", 50),
    Product("CD", 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              _productSetter(products[index]);
            },
            title: Text(products[index].name!),
            subtitle: Text(
              "\₹${products[index].price}",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }
}
