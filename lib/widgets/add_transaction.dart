import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function _addTransaction;
  final String _title;
  AddTransaction(this._addTransaction, this._title);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _amountController = TextEditingController();

  void _submitMoney() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(_amountController.text);
    if (enteredAmount <= 0) {
      return;
    }
    widget._addTransaction(enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: <Widget>[
          Text(
            widget._title,
            style: Theme.of(context).textTheme.headline5,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitMoney(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: ElevatedButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: "Quicksand", fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    _submitMoney();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
