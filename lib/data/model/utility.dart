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
  var history = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history.length; i++) {
    if (history[i].datetime.day == date.day) {
      a.add(history[i]);
    }
  }
  return a;
}

List<AddData> week() {
  List<AddData> a = [];
  DateTime date = new DateTime.now();
  var history = box.values.toList();
  for (var i = 0; i < history.length; i++) {
    if (date.day - 7 <= history[i].datetime.day &&
        history[i].datetime.day <= date.day) {
      a.add(history[i]);
    }
  }
  return a;
}

List<AddData> month() {
  List<AddData> a = [];
  var history = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history.length; i++) {
    if (history[i].datetime.month == date.month) {
      a.add(history[i]);
    }
  }
  return a;
}

List<AddData> year() {
  List<AddData> a = [];
  var history = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history.length; i++) {
    if (history[i].datetime.year == date.year) {
      a.add(history[i]);
    }
  }
  return a;
}

double totalChart(List<AddData> history) {
  List a = [0.00, 0.00];
  for (var i = 0; i < history.length; i++) {
    a.add(history[i].IN == 'Доходы'
        ? int.parse(history[i].amount)
        : int.parse(history[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<AddData> history, bool hour) {
  List<AddData> a = [];
  List total = [];
  int counter = 0;
  for (var c = 0; c < history.length; c++) {
    for (var i = c; i < history.length; i++) {
      if (hour) {
        if (history[i].datetime.hour == history[c].datetime.hour) {
          a.add(history[i]);
          counter = i;
        }
      } else {
        if (history[i].datetime.day == history[c].datetime.day) {
          a.add(history[i]);
          counter = i;
        }
      }
    }
    total.add(totalChart(a));
    a.clear();
    c = counter;
  }
  print(total);
  return total;
}
