// prefer_const_constructors

import 'package:deshbangla_fatch_api/model/category_model.dart';
import 'package:deshbangla_fatch_api/services/category.dart';
import 'package:deshbangla_fatch_api/services/category_wise_product.dart';
import 'package:deshbangla_fatch_api/widgets/text_field.dart';
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
