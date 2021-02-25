import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  final double _balance;
  Balance(this._balance);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "${_balance.toStringAsFixed(2)} €",
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Balance",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
