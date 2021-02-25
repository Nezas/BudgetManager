import 'package:flutter/material.dart';

import './widgets/balance.dart';

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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Balance(0),
            ],
          ),
        ),
      ),
    );
  }
}
