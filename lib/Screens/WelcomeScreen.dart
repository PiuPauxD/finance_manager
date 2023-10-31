import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:finance_manager/Screens/HomeScreen.dart';
import 'package:finance_manager/Widgets/NameW.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController userName = TextEditingController();
  FocusNode uN = FocusNode();

  final box = Hive.box('box');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uN.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 0, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'My Finance',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 222, 211, 255),
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.person_outline_outlined,
                      size: 70,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  cursorColor: Colors.white,
                  // focusNode: uN,
                  controller: userName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 222, 211, 255),
                  ),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    labelText: 'Введите ваше имя',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 195, 175, 255),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NameW(
                            name: userName.text,
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 222, 211, 255),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Начать',
                        style: TextStyle(
                          color: Color.fromARGB(255, 117, 72, 255),
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
