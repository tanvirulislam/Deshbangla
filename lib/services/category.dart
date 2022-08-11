import 'dart:convert';

import 'package:deshbangla_fatch_api/model/category_model.dart';
import 'package:http/http.dart' as http;

Future<Category> getCategoryData() async {
  var response = await http.get(
      Uri.parse('https://webhook.site/0a4a135c-887b-4ea4-b9cf-936db4e2f3aa'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return Category.fromJson(data);
  } else {
    return Category.fromJson(data);
  }
}
