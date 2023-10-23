import 'package:finance_manager/data/usedData.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.person_outline_outlined,
              size: 38,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                userDate.userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.more_vert_outlined,
              size: 38,
            ),
          ),
        ],
      ),
    );
  }
}
