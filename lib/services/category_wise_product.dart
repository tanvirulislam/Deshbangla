import 'dart:convert';

import 'package:deshbangla_fatch_api/model/category_product.dart';
import 'package:http/http.dart' as http;

Future<CategoryProduct> getCatProData() async {
  var response = await http.get(
      Uri.parse('https://webhook.site/de7ef799-0d59-40a7-afb8-b5bd9663593e'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return CategoryProduct.fromJson(data);
  } else {
    return CategoryProduct.fromJson(data);
  }
}
