import 'package:flutter/material.dart';
import '../widgets/transactions_list.dart';
import '../widgets/new_transaction.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: "new shoes", amount: 20.0, date: DateTime.now()),
    Transaction(id: 't2', title: "Pc", amount: 40.0, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        Transactions(this._userTransactions),
      ],
    );
  }

  void _addNewTransaction(String txTitle, double amount){
    final newTx = Transaction(title: txTitle, amount: amount, date: DateTime.now(),id: DateTime.now().toString());
    setState(() {
      this._userTransactions.add(newTx);
    });
  }
}