import 'package:flutter/material.dart';

void main() => runApp(ExpensePlannerApp());

class ExpensePlannerApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Expense planner',
     home: ExpensePlannerHomePage(),
   );
  }
}


class ExpensePlannerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense planner'),),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
