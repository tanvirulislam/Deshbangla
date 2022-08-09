import 'dart:convert';

import 'package:deshbangla_fatch_api/model/product_model.dart';
import 'package:http/http.dart' as http;

Future<Product> getProductData() async {
  var response = await http.get(
      Uri.parse('https://webhook.site/5612aa9e-dcde-49fd-b05e-562850d3a599'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return Product.fromJson(data);
  } else {
    return Product.fromJson(data);
  }
}
