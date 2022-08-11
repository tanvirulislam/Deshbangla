// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:deshbangla_fatch_api/const.dart';
import 'package:deshbangla_fatch_api/widgets/button_big.dart';
import 'package:deshbangla_fatch_api/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String productName;
  String productImage;
  String productPrice;
  String productDescription;

  ProductDetails({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Product Details', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Icon(Icons.shopping_cart_outlined),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              color: primaryColor,
              width: screenSize.width > 500 ? 200 : screenSize.width,
              height: screenSize.height * .3,
              child: Image.network(
                widget.productImage,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.productName,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('${widget.productPrice} TK / KG'),
            SizedBox(height: 8),
            ButtonBig(
              title: 'Buy Now',
              titleColor: Colors.white,
              containerColor: primaryColor,
              ontap: () {},
            ),
            SizedBox(height: 8),
            ButtonBig(
              title: 'Add To Cart',
              titleColor: primaryColor,
              containerColor: Colors.white,
              ontap: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline),
                  label: TextCustome(text: 'Add To Favorite'),
                  style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share_outlined),
                  label: TextCustome(text: 'Share'),
                )
              ],
            ),
            Text('Description', textScaleFactor: 1.4),
            SizedBox(height: 8),
            Text(widget.productDescription),
            SizedBox(height: 16),
            Center(
              child: Text('Related Fish',
                  style: TextStyle(color: primaryColor), textScaleFactor: 1.4),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
