import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Manager',
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
        'Overview',
        style: TextStyle(fontSize: 32),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text("4234 Eur", style: TextStyle(fontSize: 42),),
              Text("Balance", style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
    );
  }
}
