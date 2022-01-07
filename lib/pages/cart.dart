// import 'package:first_test_app/services/provider.dart';
// import 'package:first_test_app/widgets/catlog_item.dart';
// ignore_for_file: deprecated_member_use

import 'package:first_test_app/services/provider.dart';
import 'package:first_test_app/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  // @override
  // State<Cart> createState() => _CartState();
//}

// class _Cart<Cart> {
//   @override
  // void initState() {
  //   super.initState(); //call load data in provider
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<MyCart>(context);
    // var cart = context.watch<MyCart>();

    print(cart.items);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  // FlatButton(
                  //   child: Text('ORDER NOW'),
                  //   onPressed: () {},
                  //   textColor: Theme.of(context).primaryColor,
                  // )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => CartItem(
                cart.items.values.toList()[index].id,
                cart.items.keys.toList()[index],
                cart.items.values.toList()[index].price.toDouble(),
                cart.items.values.toList()[index].quantity,
                cart.items.values.toList()[index].name,
                cart.items.values.toList()[index].image,
              ),
            ),
          ),
        ],
      ),
    );

    //  _cart.items.isEmpty
    //       ? "Nothing to show".text.xl3.makeCentered()
  }

  // getData() {
  //   print('I am in funct');
  //   final data = MyCart().items;
  //   print('dataaaaaaaaaa$data');
  // }
}
