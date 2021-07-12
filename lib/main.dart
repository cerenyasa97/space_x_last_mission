import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spacex_last_mission/core/constants/app_theme.dart';
import 'package:spacex_last_mission/service/last_mission.dart';

import 'screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX Last Mission',
      theme: appTheme,
      home: ChangeNotifierProvider(
        create: (context) => LastMission(),
        child: Homepage(),
      ),
    );
  }
}
