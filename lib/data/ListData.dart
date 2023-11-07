import 'package:flutter/material.dart';

import '1.dart';

List<money> geter() {
  money shopping = money();
  shopping.icon = Icons.shopping_cart_outlined;
  shopping.operationName = 'Покупки';
  shopping.description = 'Продукты';
  shopping.amount = '25.0';
  shopping.time = '8.11';
  shopping.buy = false;
  money transport = money();
  transport.icon = Icons.commute_outlined;
  transport.operationName = 'Транспорт';
  transport.description = 'Траллик';
  transport.amount = '25.0';
  transport.time = '8.11';
  transport.buy = true;
  money entertainment = money();
  entertainment.icon = Icons.attractions_outlined;
  entertainment.operationName = 'Развлечения';
  entertainment.description = 'Кино';
  entertainment.amount = '25.0';
  entertainment.time = '8.11';
  entertainment.buy = false;
  return [
    shopping,
    transport,
    entertainment,
    shopping,
    transport,
    entertainment
  ];
}
