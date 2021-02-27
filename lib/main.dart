import 'package:flutter/material.dart';

import './widgets/balance.dart';
import './widgets/chart.dart';
import './widgets/add_transaction.dart';
import './widgets/settings.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Budget Manager",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.indigo,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              headline6: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _balance = 0;
  List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addMoney(double amount) {
    setState(() {
      _balance += amount;
    });
  }

  void _addExpenses(double amount) {
    final newTx = Transaction(
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _balance -= amount;
      _userTransactions.add(newTx);
    });
  }

  void _reset(double balance, List<Transaction> userTransactions) {
    setState(() {
      _balance = balance;
      _userTransactions = userTransactions;
    });
  }

  void _startAddMoney(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: context,
      builder: (_) {
        return AddTransaction(_addMoney, "Add money");
      },
    );
  }

  void _startAddExpenses(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: context,
      builder: (_) {
        return AddTransaction(_addExpenses, "Add expenses");
      },
    );
  }

  void _startSettings(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: ctx,
      builder: (_) {
        return Settings(_reset);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        "Overview",
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          iconSize: 28,
          onPressed: () {
            _startSettings(context);
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Balance(_balance),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    label: const Text(
                      "Add money",
                      style: TextStyle(
                          fontFamily: "Quicksand", fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _startAddMoney(context);
                    },
                  ),
                  ElevatedButton.icon(
                    label: const Text(
                      "Add expenses",
                      style: TextStyle(
                          fontFamily: "Quicksand", fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      _startAddExpenses(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Chart(_recentTransactions),
            ],
          ),
        ),
      ),
    );
  }
}
