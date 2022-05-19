import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: Theme.of(context).textTheme.headline6,
        // textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),

        titleTextStyle: TextStyle(color: Colors.white),
        // textTheme: Theme.of(context).textTheme.copyWith(
        //   headline6: context.textTheme.headline6.copyWith(color: Colors.white),
        // ),

        // titleTextStyle: Theme.of(context).textTheme.headline6,
        textTheme: Theme.of(context).textTheme,
      ));

  static Color creamColor = Color.fromARGB(255, 247, 240, 240);

  static Color darkCreamColor = Vx.gray900;

  static Color lightBluishColor = Vx.indigo500;
  static Color darkBluishColor = Color(0xff403b58);
}
