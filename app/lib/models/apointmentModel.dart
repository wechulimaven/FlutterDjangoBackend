import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

import 'cartmodel.dart';
// import 'package:provider/provider.dart';

class ApointmentItem with ChangeNotifier {
  int id;
  final String subject;
  final String tutor;
  // final String profile_image;
  // final String price;
  final double amount;
  final List<CartItem> orders;
  final String timestamp;

  ApointmentItem({
    @required this.id,
    @required this.amount,
    @required this.orders,
    @required this.timestamp,
    @required this.tutor,
    // @required this.profile_image,
    // @required this.price,
    // @required this.description,
    @required this.subject,
  });
  factory ApointmentItem.fromJson(Map<String, dynamic> json) {
    return ApointmentItem(
        id: json['id'],
        tutor: json['tutor'],
        amount: json['amount'],
        subject: json['subject'],
        timestamp: json['timestamp'],
        orders: json['orders']);
  }

  dynamic toJson() {
    return {
      'id': id,
      'tutor': tutor,
      'subject': subject,
      'timestamp': timestamp,
      'amount': amount,
      'orders': orders
    };
  }

  List<ApointmentItem> _items = [];
  List<ApointmentItem> get items => [..._items];

  void addAppointment(List<CartItem> appointment, double total) async {
    // final timeStamp = DateTime.now();
    final response = await http.post('http://10.0.2.2:8000/apointment/v1/',
        // headers: {"Content-Type": "application/json"}, body: json.encode(appointment));
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'subject': subject,
          'tutor': tutor,
          'timestamp': timestamp,

          'amount': total,
          // 'dateTime': timeStamp.toIso8601String(),
          'orders': appointment
              .map((cp) => {
                    'id': cp.id,
                    'subject_name': cp.subject_name,
                    'quantity': cp.quantity,
                    'price': cp.price
                  })
              .toList(),
        }));
    if (response.statusCode == 201) {
      // appointment.toString(id) = json.decode(response.body)['id'];
      _items.insert(
          0,
          ApointmentItem(
            id: json.decode(response.body)['id'],
            amount: total,
            orders: appointment,
            tutor: tutor,
            subject: subject,
            timestamp: timestamp,
          ));
      notifyListeners();
      // // else
      // {throw(err)};
    }
  }
}
