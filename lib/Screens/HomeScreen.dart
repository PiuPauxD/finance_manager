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
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                NameW(),
              ],
            ),
          ),
          const Expanded(
            flex: 3,
            child: BalanceCard(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'История транзакций',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Показать все',
                    style: TextStyle(
                      color: Color.fromARGB(255, 14, 10, 218),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...userDate.transaction.map((transaction) => TransactionTile(
                      transactionIcon: Icons.abc_outlined,
                      transaction: transaction)),
                  ...userDate.transaction.map((transaction1) => TransactionTile(
                      transactionIcon: Icons.abc_outlined,
                      transaction: transaction1)),
                  ...userDate.transaction.map(
                    (transaction2) => TransactionTile(
                        transactionIcon: Icons.abc_outlined,
                        transaction: transaction2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
