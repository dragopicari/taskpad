import 'package:apey/src/app/MyApp.dart';
import 'package:apey/src/common/Colors.dart';
import 'package:apey/src/services.dart/providers/BottomBarValueProvider.dart';
import 'package:apey/src/services.dart/providers/EventProvider.dart';
import 'package:apey/src/services.dart/providers/FavoriteProvider.dart';
import 'package:apey/src/services.dart/providers/TaskProvider.dart';
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
