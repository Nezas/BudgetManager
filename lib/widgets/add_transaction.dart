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
            widget._title,
            style: TextStyle(fontSize: 18),
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
                  child: const Text("Submit"),
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