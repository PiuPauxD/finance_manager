import 'package:finance_manager/Widgets/BalanceCard.dart';
import 'package:finance_manager/Widgets/NameW.dart';
import 'package:finance_manager/Widgets/TransactionTile.dart';
import 'package:finance_manager/data/AddData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _box = Hive.box('box');
  transactionDataBase db = transactionDataBase();

  void deleteOperation(int index) {
    setState(() {
      db.transactionList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    if (_box.get("TRANSACTIONLIST") == null) {
      db.initialState();
    } else {
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _dateTime = DateTime.now();

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const Expanded(
                flex: 1,
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
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return TransactionTile(
                      transactionIcon: Icons.emoji_transportation,
                      transactionCategory: 'Покупки',
                      transacrionDescription: 'Пыва',
                      transactionAmount: '25.0',
                      dateTime: '${_dateTime.day}.${_dateTime.month}',
                      deleteFunction: (context) => deleteOperation(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
