// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter2_app/models/catalog.dart';
import 'package:flutter2_app/utils/routes.dart';

import 'package:flutter2_app/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter2_app/widgets/home_widgets/catalog_header.dart';
import 'package:flutter2_app/widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final days = 30;

  final String name = "Flutter";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}

// class CatalogList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: CatalogModel.items!.length,
//       itemBuilder: (context, index) {
//         final catalog = CatalogModel.items![index];
//         return CatalogItem(catalog: catalog);
//       },
//     );
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final Item catalog;

//   const CatalogItem({Key? key, required this.catalog})
//       : assert(catalog != null),
//         super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//         child: Row(
//       children: [
//         CatalogImage(image: catalog.image),
//         Expanded(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             catalog.name
//                 .toString()
//                 .text
//                 .lg
//                 .color(MyTheme.darkBluishColor)
//                 .make(),
//             // catalog.desc.toString().text.textStyle(context.captionStyle).make()
//             catalog.desc.toString().text.color(Colors.grey).make(),
//             10.heightBox,
//             ButtonBar(
//               alignment: MainAxisAlignment.spaceBetween,
//               buttonPadding: EdgeInsets.zero,
//               children: [
//                 "\$${catalog.price.toString()}".text.bold.xl.make(),
//                 ElevatedButton(
//                     onPressed: () {},
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(MyTheme.darkBluishColor),
//                         shape: MaterialStateProperty.all(
//                           StadiumBorder(),
//                         )),
//                     child: "Buy".text.make())
//               ],
//             ).pOnly(right: 8.0)
//           ],
//         ))
//       ],
//     )).white.rounded.square(150).make().py16();
//   }
// }

// class CatalogImage extends StatelessWidget {
//   final String image;
//   const CatalogImage({Key? key, required this.image}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(image)
//         .box
//         .rounded
//         .p8
//         .color(MyTheme.creamColor)
//         .make()
//         .p16()
//         .w40(context);
//   }
// }

// class CatalogHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
//         "Trending Products".text.xl2.make()
//       ],
//     );
//   }
// }
