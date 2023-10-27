import 'package:finance_manager/data/usedData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransactionTile extends StatelessWidget {
  // final Transaction transaction;
  final IconData transactionIcon;
  Function(BuildContext)? deleteFunction;

  TransactionTile({
    super.key,
    // required this.transaction,
    required this.transactionIcon,
    required this.deleteFunction,
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
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 2,
              color: Color.fromARGB(179, 225, 222, 222),
            ),
          ],
        ),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete_sweep_outlined,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                  size: 36,
                ),
              ),
              // title: Text(
              //   transaction.itemCategoryName,
              //   style: const TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // subtitle: Text(
              //   transaction.itemName,
              //   style: const TextStyle(
              //     fontSize: 16,
              //     color: Color.fromARGB(255, 138, 135, 135),
              //   ),
              // ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   // transaction.amount,
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w600,
                  //     color:
                  //         transaction.transactionType == TransactionType.outflow
                  //             ? Colors.red
                  //             : Colors.green,
                  //   ),
                  // ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  // Text(
                  //   transaction.date,
                  //   style: const TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
