// To parse this JSON data, do
//
//     final slider = sliderFromJson(jsonString);

import 'dart:convert';

ShrimpSlider sliderFromJson(String str) =>
    ShrimpSlider.fromJson(json.decode(str));

String sliderToJson(ShrimpSlider data) => json.encode(data.toJson());

class ShrimpSlider {
  ShrimpSlider({
    required this.banner,
    required this.bannersecond,
  });

  List<DeshBanglaBanner> banner;
  List<DeshBanglaBanner> bannersecond;

  factory ShrimpSlider.fromJson(Map<String, dynamic> json) => ShrimpSlider(
        banner: List<DeshBanglaBanner>.from(
            json["banner"].map((x) => DeshBanglaBanner.fromJson(x))),
        bannersecond: List<DeshBanglaBanner>.from(
            json["bannersecond"].map((x) => DeshBanglaBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "bannersecond": List<dynamic>.from(bannersecond.map((x) => x.toJson())),
      };
}

class DeshBanglaBanner {
  DeshBanglaBanner({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.title,
    required this.desp,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  dynamic productId;
  String name;
  String image;
  String title;
  String desp;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory DeshBanglaBanner.fromJson(Map<String, dynamic> json) =>
      DeshBanglaBanner(
        id: json["id"],
        productId: json["product_id"],
        name: json["name"],
        image: json["image"],
        title: json["title"],
        desp: json["desp"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "name": name,
        "image": image,
        "title": title,
        "desp": desp,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
