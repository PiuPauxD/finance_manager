import 'package:finance_manager/Screens/AddScreen.dart';
import 'package:finance_manager/Screens/HomeScreen.dart';
import 'package:finance_manager/Screens/StatisticScreen.dart';

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List Screen = [HomeScreen(), AddScreen(), StatisticScreen()];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 238, 229, 229),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromARGB(255, 9, 49, 230),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home, size: 30),
          ),
          BottomNavigationBarItem(
            label: 'Add',
            icon: Icon(Icons.add, size: 30),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(Icons.history, size: 30),
          ),
        ],
      ),
    );
  }
}
