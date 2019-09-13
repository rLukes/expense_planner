import './widgets/new_transaction.dart';
import './model/transaction.dart';
import './widgets/transactions_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpensePlannerApp());

class ExpensePlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense planner',
      home: ExpensePlannerHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.blue,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 18)
          ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold)))),
    );
  }
}

class ExpensePlannerHomePage extends StatefulWidget {
  @override
  _ExpensePlannerHomePageState createState() => _ExpensePlannerHomePageState();
}

class _ExpensePlannerHomePageState extends State<ExpensePlannerHomePage> {
  String titleInput;

  final List<Transaction> _userTransactions = [
   /* Transaction(
        id: 't1', title: "New shoes", amount: 20.0, date: DateTime.now()),
    Transaction(id: 't2', title: "Bread", amount: 40.0, date: DateTime.now())*/
  ];

  void _addNewTransaction(String txTitle, double amount) {
    final newTx = Transaction(
        title: txTitle,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      this._userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense planner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
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
          Transactions(this._userTransactions)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }
}
