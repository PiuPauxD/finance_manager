import 'package:flutter/material.dart';

enum TransactionType {
  outflow,
  inflow,
}

enum ItemCategoryType {
  Transport,
  Hobbies,
  Medicine,
  Job,
}

class UserInfo {
  final String userName;
  final double totalBalance;
  final double inflow;
  final double outflow;
  // final List<Transaction> transaction;
  const UserInfo(this.userName, this.totalBalance, this.inflow, this.outflow);
  // this.transaction
}

class Transaction {
  final ItemCategoryType categoryType;
  final TransactionType transactionType;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;

  Transaction(this.categoryType, this.transactionType, this.itemCategoryName,
      this.itemName, this.amount, this.date);
}

List<Transaction> transactions = [
  Transaction(
    ItemCategoryType.Transport,
    TransactionType.inflow,
    'Транспорт',
    'траллейбус',
    '8.5',
    '18 Окт.',
  )
];
List<Transaction> transactions1 = [
  Transaction(
    ItemCategoryType.Hobbies,
    TransactionType.inflow,
    'Хобби',
    'Наушники',
    '55.90',
    '18 Окт.',
  )
];
List<Transaction> transactions2 = [
  Transaction(
    ItemCategoryType.Medicine,
    TransactionType.outflow,
    'Медицина',
    'Лекарства',
    '52.0',
    '18 Окт.',
  )
];

UserInfo userDate = UserInfo('PiuPau', 350.00, 317.58, 59.75);
