import 'package:finance_manager/Widgets/BalanceCard.dart';
import 'package:finance_manager/Widgets/NameW.dart';
import 'package:finance_manager/Widgets/TransactionTile.dart';
import 'package:finance_manager/data/usedData.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const Expanded(
                child: NameW(),
              ),
              const Expanded(
                flex: 4,
                child: BalanceCard(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'История транзакций',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'показать все',
                        style: TextStyle(
                          color: Color.fromARGB(255, 14, 10, 218),
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...transactions.map((transactions) => TransactionTile(
                          transactionIcon: Icons.emoji_transportation_outlined,
                          transaction: transactions)),
                      ...transactions1.map((transactions1) => TransactionTile(
                          transactionIcon: Icons.piano_outlined,
                          transaction: transactions1)),
                      ...transactions2.map(
                        (transactions2) => TransactionTile(
                            transactionIcon: Icons.medical_information_outlined,
                            transaction: transactions2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
