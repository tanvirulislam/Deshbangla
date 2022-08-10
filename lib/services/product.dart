import 'dart:convert';

import 'package:deshbangla_fatch_api/model/product_model.dart';
import 'package:http/http.dart' as http;

Future<Product> getProductData() async {
  var response = await http.get(
      Uri.parse('https://webhook.site/7108abc9-aa07-4376-b8a3-d44db3873035'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return Product.fromJson(data);
  } else {
    return Product.fromJson(data);
  }
}
