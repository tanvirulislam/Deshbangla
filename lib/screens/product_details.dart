// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:shrimp/const.dart';
import 'package:shrimp/model/related_products.dart';
import 'package:shrimp/services/related_fish.dart';
import 'package:shrimp/widgets/button_big.dart';
import 'package:shrimp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shrimp/widgets/top_selling_shimmer.dart';

class ProductDetails extends StatefulWidget {
  String productName;
  String productImage;
  String productPrice;
  String productDescription;
  int productId;

  ProductDetails({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
    required this.productId,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    bool isBool = false;
    // print(isBool);
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                    onPressed: () {
                      setState(() {
                        isBool = !isBool;
                      });
                    },
                    icon: isBool == false
                        ? Icon(Icons.favorite_outline)
                        : Icon(Icons.favorite),
                    label: TextCustome(text: 'Add To Favorite'),
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined),
                    label: TextCustome(text: 'Share'),
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                  )
                ],
              ),
              Text('Description', textScaleFactor: 1.4),
              SizedBox(height: 8),
              Text(widget.productDescription),
              SizedBox(height: 16),
              Center(
                child: Text('Related Fish',
                    style: TextStyle(color: primaryColor),
                    textScaleFactor: 1.4),
              ),
              SizedBox(height: 8),
              FutureBuilder(
                future: getRelatedFish(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<RelatedFish>> snapshot) {
                  if (snapshot.data == null) {
                    return TopSellingShimmer();
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenSize.width < 400 ? 2 : 4,
                      ),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 4,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment(.9, -.9),
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                            productName:
                                                snapshot.data![index].name,
                                            productImage:
                                                snapshot.data![index].image,
                                            productPrice:
                                                snapshot.data![index].sellPrice,
                                            productDescription:
                                                snapshot.data![index].desp,
                                            productId: snapshot.data![index].id,
                                          ),
                                        )),
                                    child: Container(
                                      height: 100,
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(snapshot
                                                  .data![index].image))),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.favorite_outline),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              TextCustome(text: snapshot.data![index].name),
                              Text("${snapshot.data![index].sellPrice}TK / KG"),
                              SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_cart_outlined,
                                      color: primaryColor),
                                  TextCustome(text: 'Add to cart')
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
