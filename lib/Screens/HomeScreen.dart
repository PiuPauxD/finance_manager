import 'package:finance_manager/Widgets/NameW.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: NameW(
              Hello: 'Добро пожаловать',
              name: 'Олег',
            ),
          ),
        ],
      ),
    );
  }
}
