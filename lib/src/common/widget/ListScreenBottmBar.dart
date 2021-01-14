import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/screens/event/EventDetailsScreen.dart';
import 'package:taskpad/src/screens/favorite/FavoriteDetailsScreen.dart';
import 'package:taskpad/src/services.dart/providers/BottomBarValueProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreenBottmBar extends StatelessWidget {
  final List<dynamic> cntList;
  final bool isEventList;
  final String title;
  final String noItemTitle;

  const ListScreenBottmBar({
    @required this.cntList,
    @required this.isEventList,
    @required this.title,
    @required this.noItemTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepGrey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<BottomBarValueProvider>().setIndex(2);
            Navigator.pop(context);
          },
        ),
        title: Text(title),
      ),
      body: cntList.isEmpty
          ? Center(
              child: Text(
                noItemTitle,
                style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: cntList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(isEventList
                        ? cntList[index].eventName
                        : "FAVORITE " + cntList[index][0]),
                    subtitle:
                        isEventList ? Container() : Text(cntList[index][1]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.info_rounded,
                      ),
                      onPressed: () {
                        if (isEventList) {
                          Functions.redirect(
                            context,
                            EventDetailsScreen(
                              event: cntList[index],
                            ),
                          );
                        } else {
                          Functions.redirect(
                            context,
                            FavoriteDetailsScreen(
                              favItem: cntList[index],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
