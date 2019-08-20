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
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: "new shoes", amount: 20.0, date: DateTime.now()),
    Transaction(id: 't2', title: "Pc", amount: 40.0, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense planner'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              child: Column(
                  children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          tx.amount.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.purple),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2,)),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: <Widget>[
                          Text(tx.title),
                          Text(tx.date.toString())
                        ],
                      )
                    ],
                  ),
                );
              }).toList()),
            )
          ],
        ));
  }
}
