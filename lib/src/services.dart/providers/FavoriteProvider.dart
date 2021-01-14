import 'package:apey/src/common/Functions.dart';
import 'package:apey/src/screens/favorite/FavoriteDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  bool _showOtherFields = false;

  bool get showOtherFields => _showOtherFields;

  setFieldVisibility(bool val) {
    _showOtherFields = val;
    notifyListeners();
  }

  List<List<String>> _favoriteItems = [];

  List<List<String>> get favoriteItems => _favoriteItems;

  addToFavList(List<List<String>> data) {
    _favoriteItems = data;

    notifyListeners();
  }

  clearFavList() {
    _favoriteItems.clear();
  }

  deleteItem(BuildContext context, List<String> item) {
    _favoriteItems.removeAt(_favoriteItems.indexOf(item));
    notifyListeners();
    Navigator.pop(context);
  }

  editItem(
      BuildContext context, List<String> currentItem, List<String> newItem) {
    _favoriteItems.removeAt(_favoriteItems.indexOf(currentItem));
    notifyListeners();
    _favoriteItems.add(newItem);
    Navigator.pop(context);
    Functions.redirect(context, FavoriteDetailsScreen(favItem: newItem));
  }

  submitFavorite(
    BuildContext context,
    String game,
    String console,
    String team,
    String music,
    String singer,
    String film,
    String actor,
  ) {
    if (music == "" && singer == "" && film == "" && actor == "") {
      addToFavList([
        ["GAME", game],
        ["CONSOLE", console],
        ["TEAM", team]
      ]);
    } else {
      addToFavList([
        ["GAME", game],
        ["CONSOLE", console],
        ["TEAM", team],
        ["MUSIC", music],
        ["SINGER", singer],
        ["FILM", film],
        ["ACTOR", actor]
      ]);
    }

    _showOtherFields = false;

    Navigator.popAndPushNamed(context, "/favoriteScreen");
  }
}
