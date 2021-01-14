import 'package:apey/src/common/Colors.dart';
import 'package:apey/src/common/Functions.dart';
import 'package:apey/src/common/widget/BottomNavBar.dart';
import 'package:apey/src/screens/task/TaskScreen.dart';
import 'package:apey/src/services.dart/providers/UserInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event/AddEventScreen.dart';
import 'favorite/AddFavoriteItems.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"name": "Add a task"},
    {"name": "Add some favourite"},
    {"name": "Add an event"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String name = Provider.of<UserInfoProvider>(context).userInfo.fullName;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: new BoxDecoration(
          gradient: violetGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: 68,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.developer_board,
                      color: Colors.amberAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "taskpad",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 30),
              child: Text(
                "Hello , ",
                style: TextStyle(color: Colors.grey[300], fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 15),
              child: Text(
                name.substring(0, 1).toUpperCase() + name.substring(1),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 50),
              child: Text(
                "Choose an activity to do ",
                style: TextStyle(color: Colors.grey[300], fontSize: 15),
              ),
            ),
            activityGreed(),
          ],
        ),
      ),
    );
  }

  Widget activityGreed() {
    return Expanded(
      child: GridView.builder(
        itemCount: 3,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.all(Radius.circular(35)),
              child: GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Functions.redirect(context, TaskScreen());
                      break;

                    case 1:
                      Functions.redirect(context, AddFavoriteItems());
                      break;
                    case 2:
                      Functions.redirect(
                        context,
                        AddEventScreen(event: null),
                      );
                      break;
                  }
                },
                child: Container(
                  decoration: new BoxDecoration(
                    color: deepGrey,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data[index]["name"],
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      Icon(Icons.add, size: 40, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
