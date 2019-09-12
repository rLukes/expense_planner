import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Ammount'),
              controller: amountController,
            ),
            FlatButton(
              child: Text("Add"),
              onPressed: () {
                this.addTx(titleController.text, double.parse(amountController.text));
              },
              textColor: Colors.deepOrange,
            )
          ],
        ),
      ),
    );
  }
}
