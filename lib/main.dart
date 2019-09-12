import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';

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
  String titleInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense planner'),
        ),
        body: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.deepOrangeAccent,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            UserTransaction()
          ],
        ));
  }
}
