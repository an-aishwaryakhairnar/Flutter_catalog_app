// ignore_for_file: deprecated_member_use

import 'package:first_test_app/services/provider.dart';
import 'package:first_test_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'catlog_image.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String image;

  // ignore: use_key_in_widget_constructors
  const CartItem(this.id, this.productId, this.price, this.quantity, this.title,
      this.image);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Provider.of<MyCart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        color: Colors.white70,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
          child: ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  image,
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total Price: \$${(price * quantity)}'),
            // trailing: Text('$quantity x\$$price'),
            trailing: Column(
              children: <Widget>[
                Text('$quantity x\$$price'),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Material(
                    child: InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(1),
                          child: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          print('hdghjfdgjhsdgfjdhsg');
                          confirmationAlert(context);
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void confirmationAlert(BuildContext context) {
    final cart = Provider.of<MyCart>(context, listen: false);
    print('khskfjhkjdhksdj');

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Are you sure you want to remove item from the cart?'),
      actions: <Widget>[
        FlatButton(
          child: const Text("YES"),
          onPressed: () {
            //Put your code here which you want to execute on Yes button click.
            Navigator.of(context).pop();
            cart.removeItem(productId);
          },
        ),
        FlatButton(
          child: const Text("NO"),
          onPressed: () {
            //Put your code here which you want to execute on No button click.
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
