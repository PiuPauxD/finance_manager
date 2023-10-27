import 'package:finance_manager/Screens/HomeScreen.dart';
import 'package:finance_manager/Widgets/CategoryGrid.dart';
import 'package:finance_manager/Widgets/NumPad.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var categoryName = 'Доходы';

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
          const Expanded(
            flex: 4,
            child: NumPad(),
          ),
        ],
      ),
    );
  }
}
