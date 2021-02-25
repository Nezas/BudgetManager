import 'package:flutter/material.dart';

import './add_transaction.dart';
import './chart.dart';
import '../models/transaction.dart';

//ignore: must_be_immutable
class Balance extends StatefulWidget {
  double balance;
  Balance(this.balance);
  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addMoney(double amount) {
    setState(() {
      widget.balance += amount;
    });
  }

  void _addExpenses(double amount) {
    final newTx = Transaction(
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      widget.balance -= amount;
      _userTransactions.add(newTx);
    });
  }

  void _startAddMoney(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: ctx,
      builder: (_) {
        return AddTransaction(_addMoney, "Add money");
      },
    );
  }

  void _startAddExpenses(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: ctx,
      builder: (_) {
        return AddTransaction(_addExpenses, "Add expenses");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "${widget.balance.toStringAsFixed(2)} €",
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          Text(
            "Balance",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                label: Text("Add money"),
                icon: Icon(Icons.add),
                onPressed: () {
                  _startAddMoney(context);
                },
              ),
              ElevatedButton.icon(
                label: Text("Add expenses"),
                icon: Icon(Icons.remove),
                onPressed: () {
                  _startAddExpenses(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Weekly expenses",
            style: TextStyle(fontSize: 18),
          ),
          Container(
            height: 200,
            child: Chart(_recentTransactions),
          ),
        ],
      ),
    );
  }
}
