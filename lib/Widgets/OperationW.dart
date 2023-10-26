import 'package:finance_manager/data/usedData.dart';
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
        color: const Color.fromARGB(253, 18, 62, 255),
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
                      size: 16,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      'доходы',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 217, 184, 184),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  '${userDate.inflow}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
                      size: 16,
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                      'расходы',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 217, 184, 184),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                Text(
                  '${userDate.outflow}',
                  style: const TextStyle(
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
