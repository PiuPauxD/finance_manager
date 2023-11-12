import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final opDescription;
  VoidCallback onSave;
  Description({super.key, required this.opDescription, required this.onSave});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffd3d0fb),
      content: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: widget.opDescription,
              decoration: const InputDecoration(
                hintText: 'Описание операции',
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onSave;
              },
              icon: const Icon(
                Icons.check,
                color: Colors.white,
                size: 42,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
