import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String subject_name;
  final int quantity;
  final double price;

  CartItem(
      {@required this.subject_name,
      @required this.id,
      @required this.quantity,
      @required this.price});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
        id: json['id'],
        subject_name: json['subject_name'],
        quantity: json['quantity'],
        price: json['price']);
  }

  dynamic toJson() {
    return {
      'id': id,
      'subject_name': subject_name,
      'quantity': quantity,
      'price': price,
    };
  }
}
