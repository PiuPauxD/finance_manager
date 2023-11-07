import 'package:finance_manager/data/ListData.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatefulWidget {
  const TransactionTile({super.key});

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: geter()[index].buy!
                        ? const Color.fromARGB(197, 11, 239, 68)
                        : const Color.fromARGB(136, 237, 22, 7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    child: Icon(
                      geter()[index].icon,
                      color: const Color.fromARGB(255, 9, 49, 230),
                      size: 42,
                    ),
                  ),
                ),
                title: Text(
                  '${geter()[index].operationName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  '${geter()[index].description}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${geter()[index].amount}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: geter()[index].buy!
                            ? const Color.fromARGB(255, 8, 172, 49)
                            : const Color.fromARGB(255, 255, 17, 0),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Text(
                      '${geter()[index].time}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: geter().length,
          ),
        ),
      ],
    );
  }
}
