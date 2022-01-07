import 'package:first_test_app/models/cart_items.dart';
import 'package:first_test_app/models/catalog.dart';
import 'package:first_test_app/services/provider.dart';
import 'package:first_test_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

import 'catlog_image.dart';

// ignore: must_be_immutable
class CatalogItem extends StatefulWidget {
  final Item catalog;
//  PickedFile? imageFile;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  State<CatalogItem> createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
//  State createState() {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<MyCart>(context);
    IconData iconName = Icons.shopping_cart;
    // ignore: missing_required_param
    return ChangeNotifierProvider<MyCart>(
      create: (context) => MyCart(),
      child: VxBox(
        child: Row(
          children: [
            CatalogImage(
              image: widget.catalog.image,
              key: null,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.catalog.name.text.lg
                    .color(MyTheme.darkBluishColor)
                    .bold
                    .make(),
                10.heightBox,
                Consumer<MyCart>(
                  builder:
                      (BuildContext context, MyCart myModels, Widget? child) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        "\$${widget.catalog.price}".text.bold.xl.make(),
                        ElevatedButton(
                          onPressed: () {
                            // print("button pressed");
                            // Navigator.of(context).pushNamed('/camera');
                            // const CameraWidget();
                            //  _openCamera(context);
                            cart.addItems(
                              widget.catalog.id.toString(),
                              widget.catalog.name,
                              double.parse(widget.catalog.price),
                              widget.catalog.image,
                            );

                            //print(widget.catalog.runtimeType);
                            //  myModels.doSomething(widget.catalog);
                            // setState(() {
                            // IconName = const Icon(Icons.check,
                            //     color: Colors.white, size: 24.0);
                            // });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                MyTheme.darkBluishColor,
                              ),
                              shape: MaterialStateProperty.all(
                                const StadiumBorder(),
                              )),
                          child: Wrap(
                            children: <Widget>[
                              Center(child: Icon(iconName))
                              // Icon(
                              //   // Icons.favorite,
                              //   IconName,
                              //   color: Colors.pink,
                              //   size: 24.0,
                              // ),
                            ],
                          ),
                        )
                      ],
                    ).pOnly(right: 8.0);
                  },
                )
              ],
            ))
          ],
        ),
      ).white.rounded.square(150).make().py16(),
    );
  }

  // void _openCamera(BuildContext context) async {
  //   // ignore: deprecated_member_use
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile = pickedFile!;
  //   });

  //   Navigator.pop(context);
  // }

}
