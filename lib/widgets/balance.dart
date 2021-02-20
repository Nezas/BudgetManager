import 'package:flutter/material.dart';

import './add_money.dart';

//ignore: must_be_immutable
class Balance extends StatefulWidget {
  double balance;
  Balance(this.balance);
  @override
  _BalanceState createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  void _addMoney(double amount) {
    setState(() {
      widget.balance += amount;
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
        return AddMoney(_addMoney);
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
                  print("Add");
                },
              ),
              ElevatedButton.icon(
                label: Text("Add expenses"),
                icon: Icon(Icons.remove),
                onPressed: () {
                  print("Remove");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
