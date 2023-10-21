import 'package:flutter/material.dart';

class NumPad extends StatefulWidget {
  const NumPad({super.key});

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
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

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
        horizontal: 45,
        vertical: 5,
      ),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 30,
      children: List.generate(
        numbers.length,
        (index) {
          return Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-3, -3),
                    blurRadius: 0.8,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  numbers[index],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
