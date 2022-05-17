class CatalogModel {
  // static List<Item>? items;

  static List<Item> items = [
    Item(
        id: 1,
        name: "APPLE iPhone 11",
        desc: "APPLE iPhone 11 (Black, 128 GB)",
        price: 799,
        color: "#33505a",
        image:
            "https://rukminim1.flixcart.com/image/832/832/kgiaykw0/mobile/5/x/8/apple-iphone-11-mhdh3hn-a-original-imafwqepcdfxrmhn.jpeg?q=70")
  ];
}

class Item {
  // final int? id;
  // final String? name;
  // final String? desc;
  // final num? price;
  // final String? color;
  // final String? image;

  var id;
  var name;
  var desc;
  var price;
  var color;
  var image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
    "id" : id,
    "name" : name,
    "desc" : desc,
    "price" : price,
    "color" : color,
    "image" : image,
  };
}
