import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String transactionCathegory;
  final String transactionDescriptions;
  final double transactionAmount;
  final IconData transactionIcon;
  final String date;

  const TransactionTile({
    super.key,
    required this.transactionAmount,
    required this.date,
    required this.transactionCathegory,
    required this.transactionDescriptions,
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
                color: const Color.fromARGB(255, 14, 10, 218),
                size: 50,
              ),
            ),
            title: Text(
              transactionCathegory,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              transactionDescriptions,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 138, 135, 135),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '- $transactionAmount BYN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  '$date',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
