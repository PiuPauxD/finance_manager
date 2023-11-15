import 'package:finance_manager/Screens/BottomNavBar.dart';

import 'package:finance_manager/data/model/AddData.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box<AddData>('data');

  var categoryType = 'Доходы';

  List<IconData> categoryIcon = [
    Icons.commute_outlined,
    Icons.attractions_outlined,
    Icons.emergency_outlined,
    Icons.shopping_cart_outlined,
    Icons.audiotrack_outlined,
    Icons.cases_outlined,
    Icons.cottage_outlined,
    Icons.food_bank_outlined,
    Icons.add_circle_outline,
  ];

  List<String> categoryName = [
    'Транспорт',
    'Развлечения',
    'Медицина',
    'Покупки',
    'Хобби',
    'Работа',
    'Дом',
    'Продукты',
    'Добавить',
  ];

  List<String> numbers = [
    '7',
    '8',
    '9',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    '.',
    '0',
    '⌫',
  ];

  String input = '';

  int tappedIndex = -1;

  DateTime date = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Navbar(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          size: 40,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            categoryType,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                categoryType = categoryType == 'Расходы'
                                    ? 'Доходы'
                                    : 'Расходы';
                              });
                            },
                            child: const Icon(Icons.sync_outlined,
                                color: Colors.green, size: 40),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (tappedIndex == -1) {
                            popUpMessage(
                                context: context,
                                message: "Выберите категорию!");
                          } else if (input.isEmpty) {
                            popUpMessage(
                                context: context, message: "Введите сумму!");
                          } else {
                            var add = AddData(
                              categoryIcon[tappedIndex].codePoint,
                              categoryIcon[tappedIndex].fontFamily.toString(),
                              categoryName[tappedIndex],
                              input,
                              categoryType,
                              date,
                            );
                            box.add(add);
                            popUpMessage(context: context);
                          }
                        },
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
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: categoryIcon.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tappedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: index == tappedIndex
                              ? const Color(0xffd3d0fb)
                              : Colors.white10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              tappedIndex == index
                                  ? categoryIcon[tappedIndex]
                                  : categoryIcon[index],
                              size: 30,
                              color: const Color.fromARGB(255, 14, 10, 218),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            Text(
                              tappedIndex == index
                                  ? categoryName[tappedIndex]
                                  : categoryName[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 14, 10, 218),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
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
                            input,
                            style: TextStyle(
                              fontSize: input.length > 5 ? 16 : 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //NumPad
                  ),
                  Expanded(
                    flex: 5,
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 5,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: numbers.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 35,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return NumPadButton(numbers[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget NumPadButton(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          NumPadInput(text);
        });
      },
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  NumPadInput(String text) {
    if (text == "⌫") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
        return;
      } else {
        return null;
      }
    }
    if (input.endsWith(".0 ")) {
      input = input.replaceAll(".0 ", " ");
      return;
    }
    input = input + text;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('input', input));
  }
}

Future<void> popUpMessage({required BuildContext context, String? message}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: message == null
          ? const Text('Транзакция успешно добавлена!')
          : Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Хорошо!'),
        ),
      ],
    ),
  );
}
