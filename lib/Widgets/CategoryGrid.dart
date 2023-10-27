import 'package:flutter/material.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: categoryIcon.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                categoryIcon[index],
                size: 30,
                color: const Color.fromARGB(255, 14, 10, 218),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Text(
                categoryName[index],
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 14, 10, 218),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
