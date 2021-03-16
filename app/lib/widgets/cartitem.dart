
import 'package:app/api/cartApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final String subject_name;
  final int quantity;
  final double price;

  CartPdt(this.id, this.productId, this.price, this.quantity, this.subject_name);

    @override
    Widget build(BuildContext context) {
      return Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        background: Container(
          color:Colors.red,
        ),
        onDismissed: (direction){
          Provider.of<cartProvider>(context).removeItem(productId);
        },
              child: Card(
          child: ListTile(
            leading: CircleAvatar(
              child:FittedBox(child: Text('\Sh$price'),)
            ),
            title:Text(subject_name),
            subtitle: Text('Total:\Sh${(price*quantity)}'),
            trailing: Text('$quantity x'),
          ),
          
        ),
      );
    }
}