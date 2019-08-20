import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(ExpensePlannerApp());

class ExpensePlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense planner',
      home: ExpensePlannerHomePage(),
    );
  }
}

class ExpensePlannerHomePage extends StatelessWidget {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.deepOrangeAccent,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Card(
            color: Colors.deepOrangeAccent,
           child: Text("list"),
          )
        ],
      )

    );
  }
}
