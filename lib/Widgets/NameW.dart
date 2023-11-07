import 'package:flutter/material.dart';

class NameW extends StatelessWidget {
  String _greeting() {
    final hour = TimeOfDay.now().hour;
    if (hour < 6) {
      return 'Доброй Ночи';
    } else if (hour < 12) {
      return 'Доброе Утро,';
    } else if (hour < 17) {
      return 'Добрый День,';
    } else if (hour < 21) {
      return 'Добрый Вечер';
    } else {
      return 'Доброй Ночи';
    }
  }

  const NameW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.person_outline_outlined,
              size: 38,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _greeting(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 122, 108, 108),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                ),
                const Text(
                  'Олег Сергеевич',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
