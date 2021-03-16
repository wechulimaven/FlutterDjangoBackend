import 'dart:convert';
import 'package:app/models/cartmodel.dart';
import 'package:flutter/foundation.dart';


class cartProvider with ChangeNotifier {
  Map<String, CartItem> items = {};

  Map<String, CartItem> get item{
    return {...items};
  }

  int get itemCount{
    return items.length;
  }

  void additem(String pdtid, String subject_name, double price){
    if (items.containsKey(pdtid)) {
      items.update(pdtid, (existingCartItem) => CartItem(subject_name: existingCartItem.subject_name,
       id: DateTime.now().toString(), 
       quantity: existingCartItem.quantity+1, 
       price: existingCartItem.price));
    } else {
      items.putIfAbsent(pdtid, () => CartItem(id: DateTime.now().toString(), 
      subject_name: subject_name,
      quantity: 1,
      price: price));
    }
    notifyListeners();
  }

  void removeItem(String id){
    items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id){
    if(! items.containsKey(id)){
      return;
    } if(items[id].quantity>1) {
      items.update(id, (existingCartItem) => CartItem(subject_name: existingCartItem.subject_name,
       id: DateTime.now().toString(), 
       quantity: existingCartItem.quantity-1, 
       price: existingCartItem.price));

    }
    notifyListeners();

  }

  double get totalAmount{
    var total = 0.0;
    items.forEach((key, cartItem){
      total +=cartItem.price*cartItem.quantity;
    });
    return total;
  }

  void clear(){
    items = {};
    notifyListeners();
  }
}

// class cartProvider with ChangeNotifier{
//   List<CartItem> _items=[];
//   List<CartItem> get items =>[..._items];
//   // Map<String, CartItem> _items={};
//   // Map<String, CartItem> get items =>{..._items};

//   int get ItemCount =>  items.length;
//   void AddItem( int id, String subject_name, double price, int quantity){
//     if (items.contains(id))
//       {
//         items[id] = CartItem(id: id, price: price, subject_name: subject_name, quantity: quantity+1);
//       }else{
//         // items.add(cartItem);
//         items.add(
//          CartItem(id: id, price: price, quantity: 1, subject_name: subject_name, )
//         );
//       }
//   void deleteItem(CartItem cartItem){

//   }
//   }
