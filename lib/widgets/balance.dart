import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  @override
  _BalanceState createState() => _BalanceState();
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
            style: TextStyle(fontSize: 20),
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
