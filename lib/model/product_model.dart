// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.data,
    required this.links,
    required this.meta,
  });

  final List<Datum> data;
  final Links links;
  final Meta meta;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.catSlug,
    required this.itemName,
    required this.itemSlug,
    required this.itemImage,
    required this.itemWeight,
    required this.itemDes,
    required this.purchasePrice,
    required this.sellPrice,
    required this.stock,
    required this.itemStatus,
    required this.href,
  });

  final int id;
  final String catSlug;
  final String itemName;
  final String itemSlug;
  final String itemImage;
  final String itemWeight;
  final String itemDes;
  final dynamic purchasePrice;
  final String sellPrice;
  final dynamic stock;
  final String itemStatus;
  final Href href;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        catSlug: json["cat_slug"],
        itemName: json["item_name"],
        itemSlug: json["item_slug"],
        itemImage: json["item_image"],
        itemWeight: json["item_weight"],
        itemDes: json["item_des"],
        purchasePrice: json["purchase_price"],
        sellPrice: json["sell_price"],
        stock: json["stock"],
        itemStatus: json["item_status"],
        href: Href.fromJson(json["href"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_slug": catSlug,
        "item_name": itemName,
        "item_slug": itemSlug,
        "item_image": itemImage,
        "item_weight": itemWeight,
        "item_des": itemDes,
        "purchase_price": purchasePrice,
        "sell_price": sellPrice,
        "stock": stock,
        "item_status": itemStatus,
        "href": href.toJson(),
      };
}

class Href {
  Href({
    required this.link,
  });

  final String link;

  factory Href.fromJson(Map<String, dynamic> json) => Href(
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
      };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String first;
  final String last;
  final dynamic prev;
  final String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final int from;
  final int lastPage;
  final String path;
  final int perPage;
  final int to;
  final int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
