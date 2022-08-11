// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String productName;
  String productImage;
  String productPrice;

  ProductDetails(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.productPrice})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          Icon(Icons.shopping_cart_outlined),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height * .4,
            child: Image.network(
              widget.productImage,
              fit: BoxFit.cover,
            ),
          ),
          Text(widget.productName),
          Text(widget.productPrice),
        ],
      ),
    );
  }
}
