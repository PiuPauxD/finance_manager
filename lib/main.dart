import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:finance_manager/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('box');

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Finance',
      home: WelcomeScreen(),
    ),
  );
}
