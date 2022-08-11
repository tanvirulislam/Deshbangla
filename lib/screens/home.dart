// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:deshbangla_fatch_api/const.dart';
import 'package:deshbangla_fatch_api/model/category_model.dart';
import 'package:deshbangla_fatch_api/model/product_model.dart';
import 'package:deshbangla_fatch_api/screens/banner.dart';
import 'package:deshbangla_fatch_api/screens/category_product.dart';
import 'package:deshbangla_fatch_api/screens/drawer.dart';
import 'package:deshbangla_fatch_api/screens/product_details.dart';
import 'package:deshbangla_fatch_api/services/category.dart';
import 'package:deshbangla_fatch_api/services/product.dart';
import 'package:deshbangla_fatch_api/widgets/appbar.dart';
import 'package:deshbangla_fatch_api/widgets/button.dart';
import 'package:deshbangla_fatch_api/widgets/category_shimmer.dart';
import 'package:deshbangla_fatch_api/widgets/text_field.dart';
import 'package:deshbangla_fatch_api/widgets/top_selling_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String image;
    String name;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            70,
          ),
          child: AppbarCustome(),
        ),
        drawer: DrawerScreen(),
        body: ListView(
          children: [
            SliderDeshbangla(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustome(text: 'SHOP BY CATEGORY'),
                  ButtonCustome(function: () {}, title: 'VIEW ALL')
                ],
              ),
            ),
            SizedBox(
              height: 175,
              child: FutureBuilder(
                future: getCategoryData(),
                builder:
                    (BuildContext context, AsyncSnapshot<Category> snapshot) {
                  if (snapshot.data == null) {
                    return CategoryShimmer();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 175,
                              width: screenSize.width / 3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CategoryProduct(
                                            categoryImage: snapshot
                                                .data!.data[index].image,
                                            categoryName:
                                                snapshot.data!.data[index].name,
                                          ),
                                        )),
                                    child: Container(
                                      height: 100,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data!.data[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextCustome(
                                      text: snapshot.data!.data[index].name)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Top SELLING',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: primaryColor)),
              ),
            ),
            FutureBuilder(
              future: getProductData(),
              builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
                if (snapshot.data == null) {
                  return TopSellingShimmer();
                } else {
                  return Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenSize.width < 400 ? 2 : 4,
                      ),
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 4,
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                          productName: snapshot
                                              .data!.data[index].itemName
                                              .toString(),
                                          productImage: snapshot
                                              .data!.data[index].itemImage,
                                          productPrice: snapshot
                                              .data!.data[index].sellPrice,
                                          productDescription: snapshot
                                              .data!.data[index].itemDes,
                                        ),
                                      )),
                                  child: Container(
                                    width: screenSize.width,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(snapshot
                                            .data!.data[index].itemImage),
                                      ),
                                    ),
                                  ),
                                ),
                                TextCustome(
                                    text: snapshot.data!.data[index].itemName),
                                Text(
                                    "${snapshot.data!.data[index].sellPrice}TK / KG"),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart_outlined),
                                  label: TextCustome(text: 'Add to cart'),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
