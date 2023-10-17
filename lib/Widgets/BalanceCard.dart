import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double totalBalance;
  final double inflow;
  final double outflow;

  const BalanceCard(
      {super.key,
      required this.totalBalance,
      required this.inflow,
      required this.outflow});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 9, 49, 230),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Общий баланс',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              Text(
                'BYN $totalBalance',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color.fromARGB(255, 8, 28, 118),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.arrow_downward_outlined,
                                color: Color.fromARGB(255, 91, 207, 95),
                                size: 18,
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
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Text(
                            '$inflow',
                            style: TextStyle(
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
                                size: 18,
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
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Text(
                            '$outflow',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
