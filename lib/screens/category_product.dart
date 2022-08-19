// prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:shrimp/model/category_product.dart';
import 'package:shrimp/services/category.dart';
import 'package:flutter/material.dart';
import 'package:shrimp/services/category_wise_product.dart';
import 'package:shrimp/widgets/category_shimmer.dart';

// ignore: must_be_immutable
class CategoryWiseProduct extends StatefulWidget {
  String categoryImage;
  String categoryName;
  CategoryWiseProduct({
    Key? key,
    required this.categoryImage,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<CategoryWiseProduct> createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text(widget.categoryName)),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getCatProData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<CategoryProduct> snapshot) {
                    if (snapshot.data == null) {
                      return CategoryShimmer();
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              children: [
                                Text(snapshot.data!.data[index].itemName)
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
