import 'package:app/api/apointmentApi.dart';
import 'package:app/api/cartApi.dart';
import 'package:app/models/apointmentModel.dart';
import 'package:app/models/cartmodel.dart';
import 'package:app/widgets/cartitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<cartProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('My Appointments',
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).accentColor))),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) => CartPdt(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].subject_name,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black, size: 30),
            // onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
            onPressed: (){
              
            Navigator.pushNamed(context, '/calendar');}
          ),

          CheckoutButton(cart: cart),
          // FlatButton(
          //   onPressed: (){

          //   },
          // child:
          // Text('Checkout',
          // style: TextStyle(color: Colors.blue, fontSize: 20),))
        ],
      ),
    );
   
  }
}

class CheckoutButton extends StatefulWidget {
  final cartProvider cart;

  const CheckoutButton({@required this.cart});

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Checkout'),
      onPressed: widget.cart.totalAmount <= 0
          ? null
          : () async {
              // await Provider.of<AppointmentProvider>(context, listen: false).addAppointment(
              //   // widget.cart.items.values.toList()
              //   // cartProvider.items.values.toList(),
              //   // widget.cart.item.values.toList(),
              //   widget.cart.totalAmount,
              // );
              // widget.cart.clear();
            },
    );
  }
}

