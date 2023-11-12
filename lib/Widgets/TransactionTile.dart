import 'package:finance_manager/data/model/AddData.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionTile extends StatefulWidget {
  const TransactionTile({super.key});

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  var history;
  final box = Hive.box<AddData>('data');

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              history = box.values.toList()[index];
              return getList(history, index);
            },
            childCount: box.length,
          ),
        ),
      ],
    );
  }
}

Widget getList(AddData history, int index) {
  return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        history.delete();
      },
      child: get(index, history));
}

ListTile get(int index, AddData history) {
  return ListTile(
    leading: Container(
      decoration: BoxDecoration(
        color: history.IN == 'Расходы'
            ? const Color.fromARGB(197, 11, 239, 68)
            : const Color.fromARGB(136, 237, 22, 7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        child: Icon(
          history.operationIcon,
          color: const Color.fromARGB(255, 9, 49, 230),
          size: 42,
        ),
      ),
    ),
    title: Text(
      history.operationName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    subtitle: Text(
      history.operationDescription,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          history.amount,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: history.IN == 'Расходы'
                ? const Color.fromARGB(255, 8, 172, 49)
                : const Color.fromARGB(255, 255, 17, 0),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Text(
          '${[history.datetime.weekday - 1]}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    ),
  );
}
