import 'package:flutter/material.dart';

class NameW extends StatelessWidget {
  final name;
  final Hello;
  const NameW({super.key, this.name, this.Hello});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.person_outlined,
              size: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Hello,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 122, 108, 108),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.settings_outlined,
              size: 42,
            ),
          ),
        ],
      ),
    );
  }
}
