import 'package:finance_manager/Widgets/OperationW.dart';
import 'package:finance_manager/data/usedData.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
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
          color: const Color.fromARGB(255, 19, 52, 201),
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
                  fontSize: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              Text(
                'BYN ${userDate.totalBalance}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 213, 213),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              const Center(
                child: OperationW(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
