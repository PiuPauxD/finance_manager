import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'AddData.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  IconData operationIcon;
  @HiveField(1)
  String operationName;
  @HiveField(2)
  String operationDescription;
  @HiveField(3)
  String amount;
  @HiveField(4)
  String IN;
  @HiveField(5)
  DateTime datetime;
  AddData(
      @required this.operationIcon,
      @required this.operationName,
      @required this.operationDescription,
      @required this.amount,
      @required this.IN,
      @required this.datetime);
}
