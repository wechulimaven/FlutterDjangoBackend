import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';

class Tutor extends ChangeNotifier {
  int id;
  final String tutor_name;
  final String subjects;
  final String grade;
  final double price;
  final String description;
  final String profile_image;

  Tutor(
      {this.id,
      this.tutor_name,
      this.subjects,
      this.grade,
      this.price,
      this.description,
      this.profile_image});

  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
        id: json['id'],
        tutor_name: json['tutor_name'],
        subjects: json['subjects'],
        grade: json['grade'],
        price: json['price'],
        profile_image: json['profile_image'],
        description: json['description']);
  }

  dynamic toJson() {
    return {
      'id': id,
      'tutor_name': tutor_name,
      'subjects': subjects,
      'grade': grade,
      'price': price,
      'profile_image': profile_image,
      'description': description,
    };
  }

  List<Tutor> _items = [];
  List<Tutor> get items => [..._items];

  // Tutor findById(String id) {
  //   return items.firstWhere((pdt) => pdt.id == id);
  // }
}
