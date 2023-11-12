import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:finance_manager/data/model/AddData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AddDataAdapter());
  await Hive.openBox<AddData>('data');
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Finance',
      home: Navbar(),
    ),
  );
}
