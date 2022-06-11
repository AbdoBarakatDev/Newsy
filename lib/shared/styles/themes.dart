import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
      subtitle1: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      caption: TextStyle(fontSize: 12, color: Colors.black45)),
  cardColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white),
);
ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
      subtitle1: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      caption: TextStyle(fontSize: 12, color: Colors.white)),
  cardColor: HexColor("333739"),
  scaffoldBackgroundColor: HexColor("333739"),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor("333739"),
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor("333739"),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: HexColor("333739")),
);
