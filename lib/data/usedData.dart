enum TransactionType {
  outflow,
  inflow,
}

class UserInfo {
  final String userName;
  final double totalBalance;
  final double inflow;
  final double outflow;

  UserInfo(this.userName, this.totalBalance, this.inflow, this.outflow);
}

UserInfo userDate = UserInfo('PiuPau', 350.00, 317.58, 59.75);
