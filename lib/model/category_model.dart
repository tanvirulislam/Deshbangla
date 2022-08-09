// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.data,
  });

  List<Datum> data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.href,
  });

  int id;
  String name;
  String slug;
  String image;
  Href href;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        href: Href.fromJson(json["href"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "href": href.toJson(),
      };
}

class Href {
  Href({
    required this.productLink,
  });

  String productLink;

  factory Href.fromJson(Map<String, dynamic> json) => Href(
        productLink: json["product_link"],
      );

  Map<String, dynamic> toJson() => {
        "product_link": productLink,
      };
}
