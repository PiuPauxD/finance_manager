import 'package:finance_manager/data/model/AddData.dart';
import 'package:hive_flutter/hive_flutter.dart';

double totals = 0.0;

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

List<AddData> today() {
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datetime.day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<AddData> week() {
  List<AddData> a = [];
  DateTime date = new DateTime.now();
  var history2 = box.values.toList();
  for (var i = 0; i < history2.length; i++) {
    if (date.day - 7 <= history2[i].datetime.day &&
        history2[i].datetime.day <= date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<AddData> month() {
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datetime.month == date.month) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<AddData> year() {
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datetime.year == date.year) {
      a.add(history2[i]);
    }
  }
  return a;
}

double totalChart(List<AddData> history2) {
  List a = [0.0, 0.0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].IN == 'Доходы'
        ? double.parse(history2[i].amount)
        : double.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<AddData> history2, bool hour) {
  List<AddData> a = [];
  List total = [];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (history2[i].datetime.hour == history2[c].datetime.hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (history2[i].datetime.day == history2[c].datetime.day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(totalChart(a));
    a.clear();
    c = counter;
  }

  return total;
}
