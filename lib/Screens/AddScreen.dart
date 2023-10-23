import 'package:finance_manager/Screens/HomeScreen.dart';
import 'package:finance_manager/Widgets/CategoryGrid.dart';
import 'package:finance_manager/Widgets/NumPud.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var categoryName = 'Доходы';

  String input = '0';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        size: 40,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          categoryName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              categoryName = categoryName == 'Расходы'
                                  ? 'Доходы'
                                  : 'Расходы';
                            });
                          },
                          child: Icon(Icons.sync_outlined,
                              color: Colors.green, size: 40),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 14, 10, 218),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Сохранить',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
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
          ),
          const Expanded(
            flex: 3,
            child: CategoryGrid(),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 14, 10, 218),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home_mini_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          'Сумма',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${NumPadInput(input)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    NumPadInput(input);
                  });
                },
                child: NumPad()),
          ),
        ],
      ),
    );
  }

  NumPadInput(String text) {
    if (input == "⌫") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (input.endsWith(".0")) {
      input = input.replaceAll(".0", "");
      return;
    }
    input = input + text;
  }
}
