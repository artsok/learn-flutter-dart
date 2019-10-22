import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function logicForButton;

  NewTransaction(this.logicForButton);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final entredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(entredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    //this code NO Rich
    widget.logicForButton(entredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            //Ввод данных пользователя
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: () {
                submitData();
                print("${titleController.text}  ${amountController.text}");
              },
            )
            //Ввод данных пользователя
          ],
        ),
      ),
    );
  }
}
