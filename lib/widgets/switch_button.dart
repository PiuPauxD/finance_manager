import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: Colors.grey,
      activeColor: Colors.yellow,
    );
  }
}
