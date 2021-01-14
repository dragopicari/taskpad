import 'package:taskpad/src/app/MyApp.dart';
import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/services.dart/providers/BottomBarValueProvider.dart';
import 'package:taskpad/src/services.dart/providers/EventProvider.dart';
import 'package:taskpad/src/services.dart/providers/FavoriteProvider.dart';
import 'package:taskpad/src/services.dart/providers/TaskProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'src/services.dart/providers/UserInfoProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: deepGrey));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserInfoProvider>(
          create: (_) => UserInfoProvider(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (_) => TaskProvider(),
        ),
        ChangeNotifierProvider<BottomBarValueProvider>(
          create: (_) => BottomBarValueProvider(),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(),
        ),
        ChangeNotifierProvider<EventProvider>(
          create: (_) => EventProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
