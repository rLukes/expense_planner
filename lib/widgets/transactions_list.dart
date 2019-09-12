import 'package:flutter/material.dart';
import '../model/transaction.dart';

import 'package:intl/intl.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> trans;

  Transactions(this.trans);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index){
          var tx = this.trans[index];
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '\$${tx.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      )),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("dd-MM-yyyy").format(tx.date),
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: trans.length,
      ),
    );
  }
}
