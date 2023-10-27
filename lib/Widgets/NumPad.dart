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

  String input = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          ),
        ),

        //NumPad
        Expanded(
          flex: 5,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 5,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: numbers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 35,
            ),
            itemBuilder: (BuildContext context, int index) {
              return NumPadButton(numbers[index]);
            },
          ),
        ),
      ],
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
    if (input.endsWith(".0")) {
      input = input.replaceAll(".0", "");
      return;
    }
    input = input + text;
  }
}
