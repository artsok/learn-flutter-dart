import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function logicForButton;

  NewTransaction(this.logicForButton);

  void submitData() {
    final entredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(entredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    //this code NO Rich
    logicForButton(entredTitle, enteredAmount);
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
