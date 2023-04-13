// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.productName,
    this.productPrice,
    this.productOffer,
    this.productCategory,
    this.productImage,
    this.productDesc,
    this.productRate,
  });

  String? id;
  String? productName;
  String? productPrice;
  String? productOffer;
  String? productCategory;
  String? productImage;
  String? productDesc;
  String? productRate;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    productOffer: json["product_offer"],
    productCategory: json["product_category"],
    productImage: json["product_image"],
    productDesc: json["product_desc"],
    productRate: json["product_rate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_price": productPrice,
    "product_offer": productOffer,
    "product_category": productCategory,
    "product_image": productImage,
    "product_desc": productDesc,
    "product_rate": productRate,
  };
}
