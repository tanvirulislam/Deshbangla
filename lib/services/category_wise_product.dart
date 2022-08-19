import 'dart:convert';

import 'package:shrimp/model/category_product.dart';
import 'package:http/http.dart' as http;

Future<CategoryProduct> getCatProData() async {
  var response = await http.get(
      Uri.parse('https://webhook.site/91a1c61b-1aab-4b00-b692-3bea2adb1d48'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return CategoryProduct.fromJson(data);
  } else {
    return CategoryProduct.fromJson(data);
  }
}
