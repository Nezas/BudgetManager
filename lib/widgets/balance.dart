import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  final double _balance;
  Balance(this._balance);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              _balance == 0
                  ? "${_balance.toStringAsFixed(0)} €"
                  : "${_balance.toStringAsFixed(2)} €",
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
      ),
    );
  }
}
