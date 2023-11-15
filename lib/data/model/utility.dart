import 'package:finance_manager/data/model/AddData.dart';
import 'package:hive_flutter/hive_flutter.dart';

double totals = 0;

final box = Hive.box<AddData>('name');

double total() {
  var history2 = box.values.toList();
  List a = [0.0, 0.0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].IN == 'Доходы'
        ? double.parse(history2[i].amount)
        : double.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

double income() {
  var history2 = box.values.toList();
  List a = [0.0, 0.0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].IN == 'Доходы' ? double.parse(history2[i].amount) : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

double expenses() {
  var history2 = box.values.toList();
  List a = [0.0, 0.0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
        history2[i].IN == 'Доходы' ? 0 : double.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}
