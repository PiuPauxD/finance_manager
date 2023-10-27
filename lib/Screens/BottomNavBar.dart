import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:finance_manager/Screens/AddScreen.dart';
import 'package:finance_manager/Screens/HomeScreen.dart';
import 'package:finance_manager/Screens/StatisticScreen.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List screens = [
    const HomeScreen(),
    const AddScreen(),
    const StatisticScreen(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CircleNavBar(
        activeIndex: currentIndex,
        activeIcons: [
          const Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          const Icon(
            Icons.add_outlined,
            color: Colors.white,
          ),
          const Icon(
            Icons.data_usage_outlined,
            color: Colors.white,
          ),
        ],
        inactiveIcons: [
          const Icon(
            Icons.home_outlined,
            color: Color.fromARGB(255, 14, 10, 218),
          ),
          const Icon(
            Icons.add_outlined,
            color: Color.fromARGB(255, 14, 10, 218),
          ),
          const Icon(
            Icons.data_usage_outlined,
            color: Color.fromARGB(255, 14, 10, 218),
          ),
        ],
        height: 60,
        circleWidth: 60,
        color: Colors.white,
        onTap: onTap,
        padding: const EdgeInsets.only(top: 10),
        shadowColor: const Color.fromARGB(250, 189, 184, 184),
        circleShadowColor: const Color.fromARGB(250, 189, 184, 184),
        elevation: 10,
        circleColor: Color.fromARGB(255, 14, 10, 218),
      ),
    );
  }
}
