import 'package:finance_manager/Widgets/BalanceCard.dart';
import 'package:finance_manager/Widgets/NameW.dart';
import 'package:finance_manager/Widgets/TransactionTile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: NameW(
              Hello: 'Добро пожаловать',
              name: 'PiuPau',
            ),
          ),
          const Expanded(
            flex: 3,
            child: BalanceCard(
              totalBalance: 350.00,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TransactionTile(
                    transactionIcon: Icons.piano_outlined,
                    transactionCathegory: 'Хобби',
                    transactionDescriptions: 'Лампа',
                    transactionAmount: 8.5,
                    date: '${_date.day}.${_date.month}',
                  ),
                  TransactionTile(
                    transactionIcon: Icons.piano_outlined,
                    transactionCathegory: 'Хобби',
                    transactionDescriptions: 'Лампа',
                    transactionAmount: 8.5,
                    date: '${_date.day}.${_date.month}',
                  ),
                  TransactionTile(
                    transactionIcon: Icons.piano_outlined,
                    transactionCathegory: 'Хобби',
                    transactionDescriptions: 'Лампа',
                    transactionAmount: 8.5,
                    date: '${_date.day}.${_date.month}',
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
