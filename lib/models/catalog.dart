// class CatalogModel {
//   static final items = [
//     Item(
//         id: 1,
//         name: "iPhone 12 Pro",
//         desc: "Apple iPhone 12th generation",
//         price: 599,
//         image:
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
//   ];
// }

// class Item {
//   final int id;
//   final String name;
//   final String desc;
//   final num price;
//   final String image;

//   Item(
//       {required this.id,
//       required this.name,
//       required this.desc,
//       required this.price,
//       required this.image});
// }
import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String price;
  final String image;
  final bool? flag;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image,
      required this.flag});

  Item copyWith(
      {required int id,
      required String name,
      required String desc,
      required String price,
      required String image,
      required bool flag}) {
    return Item(
        id: id, name: name, desc: desc, price: price, image: image, flag: flag);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'image': image,
      'flag': flag
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison, empty_statements

    return Item(
        id: map['id'],
        name: map['name'],
        desc: map['description'],
        price: map['price'],
        image: map['image_link'],
        flag: false);
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return '{id: $id, name: $name, desc: $desc, price: $price, image: $image,flag: $flag}';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.name == name &&
        o.desc == desc &&
        o.price == price &&
        o.image == image &&
        o.flag == flag;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        image.hashCode ^
        flag.hashCode;
  }
}
