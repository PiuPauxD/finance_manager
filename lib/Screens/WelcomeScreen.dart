import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController get userName => TextEditingController();
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
        child: Stack(
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                'My Finance',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Expanded(
              flex: 3,
              child: TextField(
                cursorColor: Colors.white,
                focusNode: uN,
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
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  var add = userName.text;
                  box.add(add);
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Navbar(),
                      ),
                    );
                  });
                },
                child: Container(
                  width: 170,
                  height: 150,
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
    );
  }
}
