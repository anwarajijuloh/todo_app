import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/core/app_theme.dart';
import '/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("myBox");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const HomePage(),
    );
  }
}
