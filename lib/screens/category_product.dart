// prefer_const_constructors

import 'package:shrimp/model/category_model.dart';
import 'package:shrimp/services/category.dart';
import 'package:shrimp/services/category_wise_product.dart';
import 'package:shrimp/widgets/text_field.dart';
import 'package:flutter/material.dart';

class CategoryProduct extends StatefulWidget {
  String categoryImage;
  String categoryName;
  CategoryProduct(
      {Key? key, required this.categoryImage, required this.categoryName})
      : super(key: key);

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: TextCustome(text: 'Chilled Condition')),
            body: Center()));
  }
}
