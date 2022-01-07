// class CatalogModel {
//   // ignore: non_constant_identifier_names
//   static final cart_items = [
//     CartItems(
//       id: 1,
//       name: "iPhone 12 Pro",
//       desc: "Apple iPhone 12th generation",
//       price: 599,
//     )
//   ];
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItems {
  final String id;
  final String name;
  final num price;
  final int quantity;
  final IconData iconName;
  final String image;

  CartItems({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.iconName = Icons.shopping_bag,
    required this.image,
  });
}
