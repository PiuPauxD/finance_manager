import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TransactionTile extends StatelessWidget {
  final IconData transactionIcon;
  final String transactionCategory;
  final String transacrionDescription;
  final String transactionAmount;
  final String dateTime;

  Function(BuildContext)? deleteFunction;

  TransactionTile({
    super.key,
    required this.transactionIcon,
    required this.transactionCategory,
    required this.transacrionDescription,
    required this.transactionAmount,
    required this.deleteFunction,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              spacing: 10,
              onPressed: deleteFunction,
              icon: Icons.delete_sweep_outlined,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: Container(
          width: double.maxFinite,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 2,
                color: Color.fromARGB(179, 225, 222, 222),
              ),
            ],
          ),
          child: Center(
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(155, 4, 234, 247),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  transactionIcon,
                  color: const Color.fromARGB(255, 9, 49, 230),
                  size: 42,
                ),
              ),
              title: Text(
                transactionCategory,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                transacrionDescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 138, 135, 135),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    transactionAmount,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      //   color:
                      //       transaction.transactionType == TransactionType.outflow
                      //           ? Colors.red
                      //           : Colors.green,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Text(
                    '${dateTime.day}.${dateTime.month}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
