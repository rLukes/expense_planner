import 'package:flutter/material.dart';
import '../model/transaction.dart';

import 'package:intl/intl.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> trans;
  final Function delete;

  Transactions(this.trans, this.delete);

  @override
  Widget build(BuildContext context) {
    return trans.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraint) {
              return Column(
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
                    height: constraint.maxHeight * 0.60,
                  )
                ],
              );
            },
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
                  title: Text(
                    trans[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(DateFormat.yMMMd().format(trans[index].date)),
                  trailing: MediaQuery.of(context).size.width > 360 ?
                      FlatButton.icon(onPressed: () => delete(trans[index].id), icon: Icon(Icons.delete), label: Text("Delete"), color: Theme.of(context).errorColor,)
                  :
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => delete(trans[index].id),
                  ),
                ),
              );
            },
            itemCount: trans.length,
          );
  }
}
