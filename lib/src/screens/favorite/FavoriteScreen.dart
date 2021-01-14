import 'package:apey/src/common/widget/ListScreenBottmBar.dart';
import 'package:apey/src/services.dart/providers/FavoriteProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);

    return ListScreenBottmBar(
      cntList: favoriteProvider.favoriteItems,
      isEventList: false,
      title: "Favorite Items",
    );
  }
}
