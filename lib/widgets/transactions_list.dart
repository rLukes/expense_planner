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
      child: trans.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text('\$${trans[index].amount}')),
                      ),
                    ),
                    title: Text(trans[index].title, style: Theme.of(context).textTheme.title,),
                    subtitle: Text(DateFormat.yMMMd().format(trans[index].date)),

                  ),
                );
              },
              itemCount: trans.length,
            ),
    );
  }
}
