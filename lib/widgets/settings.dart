import 'package:flutter/material.dart';

import '../models/transaction.dart';

class Settings extends StatefulWidget {
  final Function _reset;
  Settings(this._reset);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final double _balance = 0.0;
  final List<Transaction> _userTransactions = [];

  void reset() {
    widget._reset(_balance, _userTransactions);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: MediaQuery.of(context).size.height * 0.2 +
          MediaQuery.of(context).viewInsets.bottom,
      child: Column(
        children: <Widget>[
          Text(
            "Settings",
            style: Theme.of(context).textTheme.headline5,
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 1,
          ),
          Row(
            children: [
              TextButton.icon(
                label: Text(
                  "Reset balance and expenses",
                  style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                icon: Icon(
                  Icons.cached,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  reset();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
