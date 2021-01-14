import 'package:apey/src/common/Colors.dart';
import 'package:apey/src/common/GlobalLists.dart';
import 'package:apey/src/common/widget/DetailsScreen.dart';
import 'package:apey/src/common/widget/TextFormField.dart';
import 'package:apey/src/services.dart/providers/FavoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteDetailsScreen extends StatefulWidget {
  final List<String> favItem;

  const FavoriteDetailsScreen({@required this.favItem});

  @override
  _FavoriteDetailsScreenState createState() => _FavoriteDetailsScreenState();
}

class _FavoriteDetailsScreenState extends State<FavoriteDetailsScreen> {
  final TextEditingController newFavItemController = TextEditingController();
  String image = "";

  @override
  void initState() {
    if (widget.favItem[0] == "GAME") {
      setImage(detailFavImages[0]);
    } else if (widget.favItem[0] == "CONSOLE") {
      setImage(detailFavImages[2]);
    } else if (widget.favItem[0] == "TEAM") {
      setImage(detailFavImages[1]);
    } else if (widget.favItem[0] == "MUSIC") {
      setImage(detailFavImages[3]);
    } else if (widget.favItem[0] == "SINGER") {
      setImage(detailFavImages[4]);
    } else if (widget.favItem[0] == "FILM") {
      setImage(detailFavImages[5]);
    } else {
      setImage(detailFavImages[6]);
    }
    super.initState();
  }

  setImage(String imageName) {
    setState(() {
      image = imageName;
    });
  }

  @override
  void dispose() {
    newFavItemController.dispose();
    super.dispose();
  }

  bool showEditingBox = false;

  @override
  Widget build(BuildContext context) {
    print(widget.favItem[0]);

    return DetailsScreen(
      appBarImage: image,
      title: "Your favourite choiche :",
      child: child(),
    );
  }

  Widget child() {
    return Column(
      children: [
        showEditingBox
            ? CustomTextFormField(
                isForTaskScreen: false,
                inputController: newFavItemController,
                obscuredText: false,
                inputType: TextInputType.name,
                inputAction: TextInputAction.done,
                inputHint: "Update your new favorite " +
                    widget.favItem[0].toLowerCase(),
                isFinalInput: true,
                actionToPerform: () {
                  if (newFavItemController.text.length > 0) {
                    context.read<FavoriteProvider>().editItem(
                      context,
                      widget.favItem,
                      [widget.favItem[0], newFavItemController.text],
                    );
                  }
                },
                bgColor: Colors.white,
                hintColor: deepGrey,
                textFieldColor: deepGrey,
              )
            : Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.blueGrey[700]),
                  ),
                  child: Center(
                    child: Text(
                      widget.favItem[1],
                      style: TextStyle(color: Colors.blueGrey[600]),
                    ),
                  ),
                ),
              ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          child: showEditingBox == true
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 100,
                      child: RaisedButton(
                        color: deepGrey,
                        onPressed: () {
                          if (newFavItemController.text.length > 0) {
                            context.read<FavoriteProvider>().editItem(
                              context,
                              widget.favItem,
                              [widget.favItem[0], newFavItemController.text],
                            );
                          }
                        },
                        child: Text(
                          "DONE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      child: RaisedButton(
                        color: deepGrey,
                        onPressed: () {
                          setState(() {
                            showEditingBox = true;
                          });
                        },
                        child: Text(
                          "EDIT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        width: 100,
                        child: RaisedButton(
                          color: Colors.red[800],
                          onPressed: () {
                            context
                                .read<FavoriteProvider>()
                                .deleteItem(context, widget.favItem);
                          },
                          child: Text(
                            "DELETE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
