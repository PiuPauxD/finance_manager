import 'package:flutter/material.dart';

class CurrencyButton extends StatefulWidget {
  const CurrencyButton({super.key});

  @override
  State<CurrencyButton> createState() => _CurrencyButtonState();
}

class _CurrencyButtonState extends State<CurrencyButton> {
  String? selectedCurrency;
  final List<String> currency = [
    'BYN',
    'USD',
    'EUR',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 30,
      child: DropdownButton<String>(
        value: selectedCurrency,
        onChanged: ((value) {
          setState(() {
            selectedCurrency = value!;
          });
        }),
        items: currency
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
        selectedItemBuilder: (BuildContext context) => currency
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
          currency.first,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        dropdownColor: Colors.grey.shade100,
        isExpanded: true,
        underline: Container(),
      ),
    );
  }
}
