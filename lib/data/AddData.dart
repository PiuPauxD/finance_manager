import 'package:hive_flutter/hive_flutter.dart';

class transactionDataBase {
  List transactionList = [];

  final _box = Hive.box('box');

  //1st opening
  void initialState() {
    transactionList = [];
  }

  //load the data
  void loadData() {
    transactionList = _box.get('TRANSACTIONLIST');
  }

  //update database
  void updateDataBase() {
    _box.put('TRANSACTIONLIST', transactionList);
  }
}
