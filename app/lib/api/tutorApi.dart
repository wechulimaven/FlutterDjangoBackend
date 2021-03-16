import 'dart:convert';
import 'package:app/models/tutorModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TutorProvider with ChangeNotifier{
  TutorProvider(){
    this.fetchTutor();
  }
  List<Tutor> _items = [];
  List<Tutor> get items =>[..._items];

  Tutor findById(String id){
    return items.firstWhere((pdt)=>pdt.id==id);
  }

  fetchTutor() async{
    final url = 'https://online-student2.herokuapp.com/apis/v1/?format=json';
    final response = await http.get(url);
    if(response.statusCode == 200){
      var data = json.decode(response.body)as List;
      _items = data.map<Tutor>((json) => Tutor.fromJson(json)).toList();
      notifyListeners();
    }

  }
  
  void addTutor(Tutor tutor) async {
    final response = await http.post('https://online-student2.herokuapp.com/apis/v1/',
        headers: {"Content-Type": "application/json"}, body: json.encode(tutor));
    if (response.statusCode == 201) {
      tutor.id = json.decode(response.body)['id'];
      _items.add(tutor);
      notifyListeners();
    }
  }

  void deleteTutor(Tutor tutor) async {
    final response =
        await http.delete('https://online-student2.herokuapp.com/apis/v1/${tutor.id}/');
    if (response.statusCode == 204) {
      _items.remove(tutor);
      notifyListeners();
    }
  }

}
