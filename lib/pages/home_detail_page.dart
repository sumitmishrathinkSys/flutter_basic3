import 'package:flutter/material.dart';
import 'package:flutter2_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter2_app/models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price.toString()}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name
                          .toString()
                          .text
                          .xl4
                          .color(context.accentColor)
                          .make(),
                      catalog.desc.toString().text.color(Colors.grey).xl.make(),
                      10.heightBox,
                      "Amet accusam kasd eos vero lorem sanctus voluptua nonumy voluptua. Ea lorem et lorem voluptua dolore erat. Est sed at."
                          .text
                          // .textStyle(context.captionStyle)
                          .color(Colors.grey)
                          .make()
                    ],
                  ).py64(),
                ),
              ))
            ],
          )),
    );
  }
}
