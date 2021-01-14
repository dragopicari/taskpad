import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/screens/AddUserData.dart';
import 'package:taskpad/src/screens/favorite/FavoriteScreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: whiteAmber,
        accentColor: whiteAmber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Roboto",
      ),
      home: AddUserData(),
      routes: {'/favoriteScreen': (_) => FavoriteScreen()},
    );
  }
}
