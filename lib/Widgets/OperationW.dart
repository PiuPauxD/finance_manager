import 'package:flutter/material.dart';

class OperationW extends StatelessWidget {
  final double inflow;
  final double outflow;
  const OperationW({super.key, required this.inflow, required this.outflow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(254, 8, 28, 118),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.arrow_downward_outlined,
                      color: Color.fromARGB(255, 91, 207, 95),
                      size: 22,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      'Доходы',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 217, 184, 184),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  '$inflow',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.arrow_upward_outlined,
                      color: Colors.red,
                      size: 22,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      'Расходы',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 217, 184, 184),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  '$outflow',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
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
