import 'package:flutter/material.dart';
import 'package:flutter2_app/models/catalog.dart';
import 'package:flutter2_app/widgets/drawer.dart';
import 'package:flutter2_app/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final days = 30;
  final name = "Flutter";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "Catalog App",
          // style: TextStyle(color: Colors.black),
        ),
      ),
      // ListView builder gives us recycler view which only render the items that are visible on screen and if we scroll the screen then it rendders the other items.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),

      drawer: MyDrawer(),
    );
  }
}
