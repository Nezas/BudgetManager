import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/chart.dart';

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
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text(
          "Overview",
          style: TextStyle(fontSize: 32),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print("Settings");
            },
          ),
        ]);
    return Scaffold(
      appBar: appBar,
      body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
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
              SizedBox(
                height: 10,
              ),
              Text(
                "Weekly expenses",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 200,
                child: Chart(_recentTransactions),
              ),
            ],
          )),
    );
  }
}
