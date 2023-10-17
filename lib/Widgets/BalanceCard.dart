import 'package:finance_manager/Widgets/OperationW.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double totalBalance;

  const BalanceCard({
    super.key,
    required this.totalBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 350,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 9, 49, 230),
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
              const Center(
                child: OperationW(inflow: 35.00, outflow: 15.00),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
