import 'dart:convert';

import 'package:first_test_app/models/catalog.dart';
import 'package:first_test_app/services/api_service.dart';
import 'package:first_test_app/widgets/catelog_list.dart';
import 'package:first_test_app/widgets/catlog_header.dart';
import 'package:first_test_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController testLabel = TextEditingController();
  late final PickedFile? imageFile;
  // ignore: prefer_typing_uninitialized_variables
  late String tempVal;
  final _apiService = ApiService();

  @override
  void initState() {
    super.initState(); //call load data in provider
    loadData();
  }

  loadData() async {
    // ignore: prefer_typing_uninitialized_variables
    late final decodedData;
    String url =
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
    _apiService.fetchProducts(url).then((value) {
      decodedData = jsonDecode(value.body);
      print(value);
      //var productsData = decodedData["products"];
      CatalogModel.items = List.from(decodedData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
      setState(() {});
    });

    await Future.delayed(const Duration(seconds: 1));

    // final catalogJson =
    //     await rootBundle.loadString("assets/files/makeup_products.json");
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    // appBar: AppBar(centerTitle: true, title: const Text("Home Page")),
    // body: Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   // ignore: unnecessary_null_comparison
    //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
    // ? GridView.builder(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //     ),
    //     itemBuilder: (context, index) {
    //       final item = CatalogModel.items[index];
    //       return Card(
    //         clipBehavior: Clip.antiAlias,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10)),
    //         child: GridTile(
    //           header: Container(

    //             child: Text(
    //               item.name,
    //               style: const TextStyle(color: Colors.white),
    //             ),
    //             padding: const EdgeInsets.all(12),
    //             decoration: const BoxDecoration(
    //               color: Colors.deepPurple,
    //             ),
    //           ),
    //           child: Image.network(
    //             item.image,
    //           ),
    //           footer: Text(item.price),
    //         ),
    //       );
    //     },
    //     itemCount: CatalogModel.items.length,
    //   )
    //  ListView.builder(
    //     itemCount: CatalogModel.items.length,
    //     itemBuilder: (context, index) => ItemWidget(
    //       item: CatalogModel.items[index],
    //     ),
    //   )
    // : const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    //   ),
    //   drawer: MyDrawer(),
    // );
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: ListView.builder(
    //       itemCount: dummyList.length,
    //       itemBuilder: (context, index) {
    //         return ItemWidget(
    //           item: dummyList[index],
    //         );
    //       },
    //     ),
    //   ),
    //   drawer: MyDrawer(),
    // );
    //   body: Center(
    //     // ignore: avoid_unnecessary_containers
    //     child: Container(
    //       child: const Text("Welcome to  days of flutter by"),
    //     ),
    //   ),
    //   drawer: MyDrawer(),
    // );
    //   body: Column(
    //     children: <Widget>[
    //       TextFormField(
    //         controller: testLabel,
    //         decoration: const InputDecoration(
    //           icon: Icon(Icons.person),
    //           hintText: 'What do people call you?',
    //           labelText: 'Name *',
    //         ),
    //         onSaved: (String? value) {
    //           // This optional block of code can be used to run
    //           // code when the user saves the form.
    //         },
    //       ),
    //       OutlinedButton(onPressed: changeval(), child: const Text("click")),
    //       Text(
    //         tempVal.toString(),
    //         textAlign: TextAlign.center,
    //       )
    //     ],
    //   ),
    //  // ignore: prefer_const_constructors
    //  drawer:  MyDrawer()
    // drawer: Drawer(
    //   child: ListView(
    //     children: [
    //       const DrawerHeader(
    //           padding: EdgeInsets.zero,
    //           child: UserAccountsDrawerHeader(
    //             margin: EdgeInsets.zero,
    //             accountName: Text('Aishwarya Khairnar'),
    //             accountEmail: Text('ash@gmail.comss'),
    //           )),
    //       // ListTile(
    //       //   leading: Icon(
    //       //     CupertinoIcons.home,
    //       //     color: Colors.white,
    //       //   ),
    //       //   title: Text(
    //       //     "Home",
    //       //     textScaleFactor: 1.2,
    //       //     style: TextStyle(
    //       //       color: Colors.white,
    //       //     ),
    //       //   ),
    //       // ),
    //       ListTile(
    //         leading: const Icon(
    //           CupertinoIcons.home,
    //           color: Colors.blue,
    //         ),
    //         title: const Text(
    //           'Item 1',
    //           textScaleFactor: 1.2,
    //           style: TextStyle(
    //             color: Colors.blue,
    //           ),
    //         ),
    //         onTap: () {
    //           // Update the state of the app.
    //           // ...
    //         },
    //       ),
    //     ],
    //   ),
    // ),
    //);
    return Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.camera),
        //   backgroundColor: MyTheme.darkBluishColor,
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/cart');
        //   },
        // ),
        backgroundColor: MyTheme.creamColor,
        // backgroundColor: Colors.white70,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.shopping_cart_outlined),
        //   backgroundColor: MyTheme.darkBluishColor,
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/cart');
        //   },
        // ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: FloatingActionButton(
              onPressed: () => {
                // print(
                //     'Home===>${Provider.of<MyCart>(context, listen: false).items.length}'
                //     'Home==>${'
                //     ),

                // getDataFromProvider(),
                Navigator.of(context).pushNamed('/cart')
              },
              child: const Icon(Icons.shopping_cart_outlined),
              heroTag: "fab1",
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              _openCamera(context);
            },
            child: const Icon(Icons.camera),
            heroTag: "fab2",
          ),
        ]),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  const CatalogList().expand()
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }

  changeval() {
    tempVal = testLabel.text;
    // setState(() {});
  }

  _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }

  getDataFromProvider() {
    // List data = MyModel().cartItems;
    //print(data);
  }
}
