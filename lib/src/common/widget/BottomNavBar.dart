import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/screens/HomeScreen.dart';
import 'package:taskpad/src/screens/ProfileScreen.dart';
import 'package:taskpad/src/screens/event/EventScreen.dart';
import 'package:taskpad/src/screens/favorite/FavoriteScreen.dart';
import 'package:taskpad/src/screens/task/TaskScreen.dart';
import 'package:taskpad/src/services.dart/providers/BottomBarValueProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavigationBarItem item(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 3.0),
        child: Icon(
          icon,
          size: 20,
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    BottomBarValueProvider bottomBarValueProvider =
        Provider.of<BottomBarValueProvider>(context);

    return BottomNavigationBar(
      currentIndex: bottomBarValueProvider.selectedIndex,
      onTap: (value) {
        if (bottomBarValueProvider.selectedIndex != value) {
          bottomBarValueProvider.setIndex(value);
          switch (value) {
            case 0:
              Functions.redirect(context, FavoriteScreen());
              break;
            case 0:
              Functions.redirect(context, EventScreen());
              break;
            case 2:
              Functions.redirect(context, HomeScreen());
              break;
            case 3:
              Functions.redirect(context, TaskScreen());
              break;
            case 4:
              Functions.redirect(context, ProfileScreen());
              break;
          }
        }
      },
      backgroundColor: deepGrey,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[500],
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.white),
      selectedFontSize: 12,
      items: [
        item(Icons.favorite, "Favorite"),
        item(CupertinoIcons.bookmark_solid, "Event"),
        item(Icons.home, "Home"),
        item(CupertinoIcons.add_circled, "Task"),
        item(Icons.person, "Profile"),
      ],
    );
  }
}
