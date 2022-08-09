// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:deshbangla_fatch_api/const.dart';
import 'package:deshbangla_fatch_api/model/category_model.dart';
import 'package:deshbangla_fatch_api/model/product_model.dart';
import 'package:deshbangla_fatch_api/screens/banner.dart';
import 'package:deshbangla_fatch_api/services/category.dart';
import 'package:deshbangla_fatch_api/services/product.dart';
import 'package:deshbangla_fatch_api/widgets/appbar.dart';
import 'package:deshbangla_fatch_api/widgets/button.dart';
import 'package:deshbangla_fatch_api/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: AppbarCustome(),
        ),
        drawer: Drawer(),
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
                    return Center(
                      child: CircularProgressIndicator(),
                    );
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
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data!.data[index].image),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )),
                                  // Text(snapshot.data!.data[index].name),
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
            SizedBox(
              height: 400,
              child: FutureBuilder(
                future: getProductData(),
                builder:
                    (BuildContext context, AsyncSnapshot<Product> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: primaryColor,
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
