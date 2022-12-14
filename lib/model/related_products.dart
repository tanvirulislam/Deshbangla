// To parse this JSON data, do
//
//     final relatedFish = relatedFishFromJson(jsonString);

import 'dart:convert';

List<RelatedFish> relatedFishFromJson(String str) => List<RelatedFish>.from(
    json.decode(str).map((x) => RelatedFish.fromJson(x)));

String relatedFishToJson(List<RelatedFish> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RelatedFish {
  RelatedFish({
    required this.id,
    required this.userPostId,
    // required this.categorySlug,
    required this.subcategorySlug,
    // required this.storeId,
    required this.name,
    required this.productSlug,
    required this.desp,
    required this.weight,
    required this.purchasePrice,
    required this.sellPrice,
    required this.stock,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  dynamic userPostId;
  // CategorySlug categorySlug;
  String subcategorySlug;
  // StoreId storeId;
  String name;
  String productSlug;
  String desp;
  String weight;
  dynamic purchasePrice;
  String sellPrice;
  dynamic stock;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory RelatedFish.fromJson(Map<String, dynamic> json) => RelatedFish(
        id: json["id"],
        userPostId: json["user_post_id"],
        // categorySlug: categorySlugValues.map[json["category_slug"]],
        subcategorySlug: json["subcategory_slug"],
        // storeId: storeIdValues.map[json["store_id"]],
        name: json["name"],
        productSlug: json["product_slug"],
        desp: json["desp"],
        weight: json["weight"],
        purchasePrice: json["purchase_price"],
        sellPrice: json["sell_price"],
        stock: json["stock"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_post_id": userPostId,
        // "category_slug": categorySlugValues.reverse[categorySlug],
        "subcategory_slug": subcategorySlug,
        // "store_id": storeIdValues.reverse[storeId],
        "name": name,
        "product_slug": productSlug,
        "desp": desp,
        "weight": weight,
        "purchase_price": purchasePrice,
        "sell_price": sellPrice,
        "stock": stock,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

// enum CategorySlug { READY_TO_COOK_1, CHILLED_CONDITION }

// final categorySlugValues = EnumValues({
//   "chilled-condition": CategorySlug.CHILLED_CONDITION,
//   "ready-to-cook-1": CategorySlug.READY_TO_COOK_1
// });

// enum StoreId { KHULNA_STORE, KHULNA_STORE_SELECTED }

// final storeIdValues = EnumValues({
//   "khulna-store": StoreId.KHULNA_STORE,
//   "khulna-store selected": StoreId.KHULNA_STORE_SELECTED
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
