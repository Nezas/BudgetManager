import 'package:flutter/foundation.dart';

class Transaction {
  final double amount;
  final DateTime date;

  Transaction({
    @required this.amount,
    @required this.date,
  });
}
