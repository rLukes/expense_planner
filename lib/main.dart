import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './model/transaction.dart';
import './widgets/transactions_list.dart';

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
          errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              button: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
    );
  }
}

class ExpensePlannerHomePage extends StatefulWidget {
  @override
  _ExpensePlannerHomePageState createState() => _ExpensePlannerHomePageState();
}

class _ExpensePlannerHomePageState extends State<ExpensePlannerHomePage> {
  String titleInput;
  bool _showChart = false;

  final List<Transaction> _userTransactions = [
    /* Transaction(
        id: 't1', title: "New shoes", amount: 20.0, date: DateTime.now()),
    Transaction(id: 't2', title: "Bread", amount: 40.0, date: DateTime.now())*/
  ];

  List<Transaction> get _recentTransactions {
    return this._userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double amount, DateTime date) {
    final newTx = Transaction(
        title: txTitle,
        amount: amount,
        date: date,
        id: DateTime.now().toString());
    setState(() {
      this._userTransactions.add(newTx);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((r) => r.id == id);
      // or
/*      _userTransactions.removeWhere((tx){
        return tx.id == id;
      });*/
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final isLandscape = _mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Expense planner'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text('Expense planner'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              )
            ],
          );

    final txListWidget = Container(
        height: (_mediaQuery.size.height - appBar.preferredSize.height) * 0.7,
        child: Transactions(_recentTransactions, deleteTransaction));

    final _pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  )
                ],
              ),
            if (!isLandscape)
              Container(
                  height:
                      (_mediaQuery.size.height - appBar.preferredSize.height) *
                          0.3,
                  child: Chart(this._userTransactions)),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (_mediaQuery.size.height -
                              appBar.preferredSize.height) *
                          0.7,
                      child: Chart(this._userTransactions))
                  : txListWidget
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: _pageBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
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
