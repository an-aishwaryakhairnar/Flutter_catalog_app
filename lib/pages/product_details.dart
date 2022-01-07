import 'package:first_test_app/models/catalog.dart';
import 'package:first_test_app/services/provider.dart';
import 'package:first_test_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatefulWidget {
  final Item catalog;

  ProductDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool showCartBtn = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<MyCart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          //  margin: const EdgeInsets.only(top: 10.0),
          children: [
            // "\$${catalog.price}".text.bold.xl4.red800.make(),
            Text(
              "\$" + widget.catalog.price,
              style: const TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Visibility(
              visible: !showCartBtn,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showCartBtn = true;
                  });
                  cart.addItems(
                      widget.catalog.id.toString(),
                      widget.catalog.name,
                      double.parse(widget.catalog.price),
                      widget.catalog.image);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluishColor,
                    ),
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    )),
                child: const Text("Buy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                //.text.make(),
              ),
            ),
            //.wh(100, 50)
            Visibility(
              visible: showCartBtn,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluishColor,
                    ),
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    )),
                child: const Visibility(
                  child: Text("Go To Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //Center(child: Image.network(catalog.image)),

            Center(
              child: Hero(
                tag: Key(widget.catalog.id.toString()),
                child: Image.network(widget.catalog.image),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Text(
                        widget.catalog.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: MyTheme.darkBluishColor,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 10, right: 10),
                        child: Text(
                          widget.catalog.desc,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: MyTheme.darkBluishColor,
                              fontSize: 16,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Expanded(
            //     child: VxArc(
            //   height: 30.0,
            //   arcType: VxArcType.CONVEY,
            //   edge: VxEdge.TOP,
            //   child: Container(
            //     color: Colors.white,
            //     width: ,
            //     child: Column(
            //       children: [
            //         catalog.name.text.xl2
            //             .color(MyTheme.darkBluishColor)
            //             .bold
            //             .center
            //             .make(),
            //         catalog.desc.text.fade.make(),
            //         10.heightBox,
            //       ],
            //     ),
            //   ),
            // ))
          ],
        ),
      ),
    );
  }
}
