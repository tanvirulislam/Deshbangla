import 'dart:convert';

import 'package:shrimp/model/related_products.dart';
import 'package:http/http.dart' as http;

// Future<RelatedFish> getRelatedFish() async {
//   var response = await http.get(
//       Uri.parse('https://webhook.site/0a4a135c-887b-4ea4-b9cf-936db4e2f3aa'));
//   var data = jsonDecode(response.body.toString());
//   if (response.statusCode == 200) {
//     return RelatedFish.fromJson(data);
//   } else {
//     return RelatedFish.fromJson(data);
//   }
// }

List<RelatedFish> relatedFish = [];
Future<List<RelatedFish>> getRelatedFish() async {
  final response = await http.get(
      Uri.parse('https://webhook.site/3d000587-b3e0-4928-87a0-abfbf82d27dd'));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var i in data) {
      relatedFish.add(RelatedFish.fromJson(i));
    }
    return relatedFish;
  } else {
    return relatedFish;
  }
}
