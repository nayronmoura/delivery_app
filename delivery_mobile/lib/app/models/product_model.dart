import 'package:flutter/material.dart';

enum ProductCategory {
  alimento,
  bebida,
  variedades,
  mercado,
  lanches,
  refeicao,
  gelado,
  farmacia,
  unknown
}

extension ProductCategoryExt on ProductCategory {
  static ProductCategory toEnum(String value) =>
      {
        "ALIMENTO": ProductCategory.alimento,
        "BEBIDA": ProductCategory.bebida,
        "VARIEDADES": ProductCategory.variedades,
        "MERCADO": ProductCategory.mercado,
        "LANCHES": ProductCategory.lanches,
        "REFEICAO": ProductCategory.refeicao,
        "GELADO": ProductCategory.gelado,
        "FARMACIA": ProductCategory.farmacia,
      }[value] ??
      ProductCategory.unknown;

  String get toApi {
    return toString().toUpperCase();
  }

  String get name =>
      {
        ProductCategory.alimento: "Alimento",
        ProductCategory.bebida: "Bebida",
        ProductCategory.variedades: "Variedades",
        ProductCategory.mercado: "Mercado",
        ProductCategory.lanches: "Lanches",
        ProductCategory.refeicao: "Refeição",
        ProductCategory.gelado: "Gelado",
        ProductCategory.farmacia: "Farmácia",
        ProductCategory.unknown: "Unknow",
      }[this] ??
      "Unknow";

  IconData get icon =>
      {
        ProductCategory.alimento: Icons.fastfood,
        ProductCategory.bebida: Icons.local_drink,
        ProductCategory.variedades: Icons.category,
        ProductCategory.mercado: Icons.shopping_cart,
        ProductCategory.lanches: Icons.fastfood,
        ProductCategory.refeicao: Icons.fastfood,
        ProductCategory.gelado: Icons.icecream,
        ProductCategory.farmacia: Icons.medical_services,
        ProductCategory.unknown: Icons.error,
      }[this] ??
      Icons.error;
}

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String? image;
  final double price;

  final ProductCategory category;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      this.image,
      required this.price,
      required this.category});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      category: ProductCategoryExt.toEnum(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'category': category.name,
    };
  }
}
