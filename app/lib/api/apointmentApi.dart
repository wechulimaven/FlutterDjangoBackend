import 'dart:convert';
import 'package:app/models/apointmentModel.dart';
import 'package:app/models/cartmodel.dart';
import 'package:app/models/tutorModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentProvider with ChangeNotifier{
  // AppointmentProvider(){
  //   this.fetchAppointment();
  // }
  List<ApointmentItem> _items = [];
  List<ApointmentItem> get items =>[..._items];

  // fetchAppointment() async{
  //   final url = 'http://10.0.2.2:8000/apis/v1/?format=json';
  //   final response = await http.get(url);
  //   if(response.statusCode == 200){
  //     var data = json.decode(response.body)as List;
  //     _items = data.map<ApointmentItem>((json) => ApointmentItem.fromJson(json)).toList();
  //     notifyListeners();
  //   }

  // }
  
//   void addAppointment(List<CartItem> appointment, double total) async {
//     // final timeStamp = DateTime.now();
//     final response = await http.post('http://10.0.2.2:8000/apointment/v1/',
//         // headers: {"Content-Type": "application/json"}, body: json.encode(appointment));
//         headers: {"Content-Type": "application/json"}, body: json.encode({

// 'subject':subject,
// 'tutor':tutor,
// 'timestamp':timestamp,

//         'amount': total,
//         // 'dateTime': timeStamp.toIso8601String(),
//         'orders': appointment.map((cp) => {
//           'id':cp.id,
//           'subject_name':cp.subject_name,
//           'quantity': cp.quantity,
//           'price': cp.price
//         }).toList(),
//         }));
//     if (response.statusCode == 201) {
//       appointment.id = json.decode(response.body)['id'];
//       _items.add('orders':appointment.map(f)
//       notifyListeners();
//     // else
//     // {throw(err)};
//     }
  }

  // void deleteAppointment(ApointmentItem appointment) async {
  //   final response =
  //       await http.delete('http://10.0.2.2:8000/apointment/v1/${appointment.id}/');
  //   if (response.statusCode == 204) {
  //     _items.remove(appointment);
  //     notifyListeners();
  //   }
  // }





// class Orders with ChangeNotifier {
//   List<ApointmentItem> _items = [];
//   List<ApointmentItem> get items =>[..._items];

//   Future<void> addOrder(List<CartItem> cartstudents,double total)async{
//     final url= 'https://shoppibg-tube.firebaseio.com/orders.json';
//     final timeStamp = DateTime.now();
//     try{
//       final response = await http.post(url, body:json.encode({
//         'id': DateTime.now().toString(),
//         'amount': total,
//         'dateTime': timeStamp.toIso8601String(),
//         'students': cartstudents.map((cp) => {
//           'id':cp.id,
//           'title':cp.name,
//           'day': cp.day,
//           'time': cp.time,
//         }).toList(),
//       }));
//       items.insert(0, ApointmentItem(
//         id:json.decode(response.body)['name'],
//         amount: total,
//         dateTime: timeStamp,
//         students: cartstudents
//       ));
//       notifyListeners();
//     }catch(err) {
//       throw err;
//     }
//   }

// }
