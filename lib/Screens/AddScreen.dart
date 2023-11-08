import 'package:finance_manager/Screens/BottomNavBar.dart';
import 'package:finance_manager/Widgets/NumPad.dart';
import 'package:finance_manager/data/AddData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var categoryType = 'Доходы';
  final _box = Hive.box('box');
  transactionDataBase db = transactionDataBase();

  void saveTransaction() {
    setState(() {
      db.transactionList.add([
        db.transactionList.add(
          [
            categoryIcon,
            categoryName,
          ],
        ),
      ]);
    });
  }

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

  int tappedIndex = -1;

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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Navbar(),
                          ),
                        );
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
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.white10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          tappedIndex == null
                              ? categoryIcon[tappedIndex]
                              : categoryIcon[index],
                          size: 30,
                          color: index == tappedIndex
                              ? const Color(0xffd3d0fb)
                              : const Color.fromARGB(255, 14, 10, 218),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Text(
                          tappedIndex == null
                              ? categoryName[tappedIndex]
                              : categoryName[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: index == tappedIndex
                                ? const Color(0xffd3d0fb)
                                : const Color.fromARGB(255, 14, 10, 218),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
