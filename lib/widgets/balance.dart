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
            style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 42,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Balance",
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
