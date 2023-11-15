import 'package:hive/hive.dart';

part 'AddData.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  int operationIcon;
  @HiveField(1)
  String iconFamily;
  @HiveField(2)
  String operationName;
  @HiveField(3)
  String amount;
  @HiveField(4)
  String IN;
  @HiveField(5)
  DateTime datetime;
  AddData(this.operationIcon, this.iconFamily, this.operationName, this.amount,
      this.IN, this.datetime);
}
