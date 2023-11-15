import 'package:hive/hive.dart';

part 'AddData.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  String operationIcon;
  @HiveField(1)
  String operationName;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String IN;
  @HiveField(4)
  DateTime datetime;
  AddData(this.operationIcon, this.operationName, this.amount, this.IN,
      this.datetime);
}
