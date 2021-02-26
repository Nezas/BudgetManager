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
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              FlatButton.icon(
                label: Text(
                  "Reset balance and expenses",
                  style: TextStyle(fontSize: 18),
                ),
                icon: Icon(Icons.cached),
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