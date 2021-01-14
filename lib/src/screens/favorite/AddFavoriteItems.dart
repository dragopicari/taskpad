import 'dart:async';

import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/common/GlobalLists.dart';
import 'package:taskpad/src/common/widget/TextFormField.dart';
import 'package:taskpad/src/services.dart/providers/FavoriteProvider.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FavoriteScreen.dart';

class AddFavoriteItems extends StatefulWidget {
  @override
  _AddFavoriteItemsState createState() => _AddFavoriteItemsState();
}

class _AddFavoriteItemsState extends State<AddFavoriteItems> {
  final TextEditingController faveGame = TextEditingController();
  final TextEditingController favTeamName = TextEditingController();
  final TextEditingController favConsole = TextEditingController();
  final TextEditingController favMusic = TextEditingController();
  final TextEditingController favSinger = TextEditingController();
  final TextEditingController favActor = TextEditingController();
  final TextEditingController favFilm = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  FavoriteProvider favoriteProvider;

  @override
  void didChangeDependencies() {
    favoriteProvider = Provider.of<FavoriteProvider>(context);

    if (favoriteProvider.favoriteItems.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
      });
    }

    scheduleMicrotask(() {
      precacheImage(NetworkImage(detailFavImages[0]), context);
      precacheImage(NetworkImage(detailFavImages[1]), context);
      precacheImage(NetworkImage(detailFavImages[2]), context);
      precacheImage(NetworkImage(detailFavImages[3]), context);
      precacheImage(NetworkImage(detailFavImages[4]), context);
      precacheImage(NetworkImage(detailFavImages[5]), context);
      precacheImage(NetworkImage(detailFavImages[6]), context);
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    faveGame.dispose();
    favTeamName.dispose();
    favConsole.dispose();
    favMusic.dispose();
    favSinger.dispose();
    favActor.dispose();
    favFilm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF181829),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Favorite Screen"),
      ),
      backgroundColor: Color(0XFF181829),
      body: favoriteProvider.favoriteItems.isNotEmpty
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lime),
              ),
            )
          : Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Container(
                            width: size.width,
                            height: 220,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: AssetImage("assets/fav.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Fill the form with your preferences",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Form(
                          key: globalKey,
                          child: Column(
                            children: [
                              field(
                                Emojis.videoGame,
                                false,
                                faveGame,
                                false,
                                TextInputType.name,
                                TextInputAction.next,
                                "Insert your favorite game",
                                false,
                                null,
                              ),
                              field(
                                Emojis.family,
                                false,
                                favTeamName,
                                false,
                                TextInputType.name,
                                TextInputAction.next,
                                "Insert your favorite team",
                                false,
                                null,
                              ),
                              field(
                                Emojis.desktopComputer,
                                false,
                                favConsole,
                                false,
                                TextInputType.name,
                                TextInputAction.next,
                                "Insert your favorite console",
                                false,
                                null,
                              ),
                            ],
                          ),
                        ),
                        favoriteProvider.showOtherFields
                            ? otherField()
                            : Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, bottom: 150),
                                  child: Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    color: Colors.red[300],
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        favoriteProvider
                                            .setFieldVisibility(true);
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 25,
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "MORE ...",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (!globalKey.currentState.validate()) {
                            Functions.returnDialog(
                              context,
                              "Please fill all the field",
                              true,
                            );
                          } else {
                            favoriteProvider.submitFavorite(
                              context,
                              faveGame.text,
                              favConsole.text,
                              favTeamName.text,
                              favMusic.text,
                              favSinger.text,
                              favFilm.text,
                              favActor.text,
                            );
                          }
                        },
                        child: Container(
                          width: size.width / 1.3,
                          height: 55,
                          decoration: new BoxDecoration(
                            color: sky,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Save to favorite",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget otherField() {
    return Column(
      children: [
        field(
          Emojis.musicalNote,
          false,
          favMusic,
          false,
          TextInputType.name,
          TextInputAction.next,
          "Insert your favorite music",
          false,
          null,
        ),
        field(
          Emojis.singer,
          false,
          favSinger,
          false,
          TextInputType.name,
          TextInputAction.next,
          "Insert your favorite singer",
          false,
          null,
        ),
        field(
          Emojis.filmProjector,
          false,
          favFilm,
          false,
          TextInputType.name,
          TextInputAction.next,
          "Insert your favorite film",
          false,
          null,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: field(
            Emojis.person,
            false,
            favActor,
            false,
            TextInputType.name,
            TextInputAction.next,
            "Insert your favorite actor",
            false,
            null,
          ),
        ),
      ],
    );
  }

  Widget field(
    String emojy,
    bool isForTaskScreen,
    TextEditingController inputController,
    bool obscuredText,
    TextInputType inputType,
    TextInputAction inputAction,
    String inputHint,
    bool isFinalInput,
    VoidCallback actionToPerform,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            emojy,
            style: TextStyle(fontSize: 30),
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            isForTaskScreen: isForTaskScreen,
            inputController: inputController,
            obscuredText: obscuredText,
            inputType: inputType,
            inputAction: inputAction,
            inputHint: inputHint,
            isFinalInput: isFinalInput,
            actionToPerform: actionToPerform,
            bgColor: deepGrey,
            hintColor: Colors.amber[700].withOpacity(0.5),
            textFieldColor: Colors.amber[700].withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
