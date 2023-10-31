import 'package:flutter/material.dart';

class OperationW extends StatelessWidget {
  const OperationW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(252, 24, 14, 161),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_downward_outlined,
                      color: Color.fromARGB(255, 91, 207, 95),
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      'Доходы',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 217, 184, 184),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  '1500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      'Расходы',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 217, 184, 184),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  '150',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
