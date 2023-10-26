import 'package:finance_manager/data/usedData.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final IconData transactionIcon;

  const TransactionTile({
    super.key,
    required this.transaction,
    required this.transactionIcon,
  });

  @override
  Widget build(BuildContext context) {
    // DateTime? date = DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Container(
        width: double.maxFinite,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 2,
              color: const Color.fromARGB(179, 225, 222, 222),
            ),
          ],
        ),
        child: Center(
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(155, 4, 234, 247),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                transactionIcon,
                color: const Color.fromARGB(255, 9, 49, 230),
                size: 36,
              ),
            ),
            title: Text(
              transaction.itemCategoryName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              transaction.itemName,
              style: const TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 138, 135, 135),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transaction.amount,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color:
                        transaction.transactionType == TransactionType.outflow
                            ? Colors.red
                            : Colors.green,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  transaction.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
