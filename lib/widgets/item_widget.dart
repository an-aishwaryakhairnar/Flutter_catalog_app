import 'package:first_test_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      // ignore: unnecessary_null_comparison
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        // leading: Image.network(
        //   item.image,
        //   width: 20,
        //   height: 20,
        //   fit: BoxFit.cover,
        // ),
        leading: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 64,
              maxHeight: 64,
            ),
            child: Image.network(
              item.image,
              fit: BoxFit.cover,
            )),
        title: Text(
          item.name,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
        ),

        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
