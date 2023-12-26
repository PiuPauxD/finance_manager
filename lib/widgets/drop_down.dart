import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedLanguage;
  final List<String> languages = [
    'eng',
    'rus',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 30,
      child: DropdownButton<String>(
        value: selectedLanguage,
        onChanged: ((value) {
          setState(() {
            selectedLanguage = value!;
          });
        }),
        items: languages
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(
                          e,
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
        selectedItemBuilder: (BuildContext context) => languages
            .map((e) => Row(
                  children: [
                    Text(
                      e,
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ],
                ))
            .toList(),
        hint: Text(
          languages.first,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        dropdownColor: Colors.grey.shade100,
        isExpanded: true,
        underline: Container(),
      ),
    );
  }
}
