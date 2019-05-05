import 'package:flutter/material.dart';
import 'package:music_player_flutter/res/theme.dart';
import 'package:music_player_flutter/page/home_page.dart';

void main() => runApp(MyMaterialApp());

class MyMaterialApp extends StatefulWidget {
  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: HomePage(),
    );
  }
}


