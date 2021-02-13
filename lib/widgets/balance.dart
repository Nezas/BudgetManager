import 'package:flutter/material.dart';

import './add_money.dart';

class Balance extends StatefulWidget {
  @override
  _BalanceState createState() => _BalanceState();
}

void _startAddMoney(BuildContext ctx) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    context: ctx,
    builder: (_) {
      return AddMoney();
    },
  );
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "0 €",
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
