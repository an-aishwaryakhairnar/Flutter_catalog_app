import 'package:first_test_app/models/cart_items.dart';
import 'package:flutter/material.dart';

class MyCart with ChangeNotifier {
  IconData iconName = Icons.shopping_cart;
  String someValue = 'Hello';
  // List cartItems = [];
  final Map<String, CartItems> _items = {};
  Map<String, CartItems> get items {
    print(_items);
    // cartItems.add(_items);
    // _items.addAll({
    //   "productId": CartItems(id: '1', name: 'ash', price: 20.22, quantity: 1)
    // });
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // doSomething(String) {
  //   print(catalogItem);

  //   //  late final  catalogItem<Item>;
  //   if (catalogItem.flag == true) {
  //     print('Its in if');
  //     catalogItem.flag == false;
  //   } else {
  //     print('Its in else');
  //     catalogItem.flag == true;
  //     cartItems.addAll(catalogItem);
  //     print('this is an array ===>$cartItems');
  //   }
  //cartItems = cartItems.add(catalogItem);
  void addItems(String productId, String title, num price, String image) {
    print("Items as params $title $price $productId");
    print(_items.containsKey(productId));
    if (_items.containsKey(productId)) {
      //chnge count of product
      _items.update(
        productId,
        (existingCartItems) => CartItems(
            id: existingCartItems.id,
            name: existingCartItems.name,
            price: existingCartItems.price,
            quantity: existingCartItems.quantity + 1,
            iconName: Icons.check,
            image: image),
      );
      // iconName = Icons.check;
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItems(
          id: productId,
          name: title,
          price: price,
          quantity: 1,
          iconName: Icons.check,
          image: image,
        ),
      );
      //iconName = Icons.check;
      print(_items.length);
      // cartItems.add(_items);
      // _items.addAll({
      //   "productId": CartItems(id: '1', name: 'ash', price: 20.22, quantity: 1)
      // });

      // print(_items['productId']?.name.toString());

    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
