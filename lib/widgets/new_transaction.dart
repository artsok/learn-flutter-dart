import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function logicForButton;

  NewTransaction(this.logicForButton);

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
//                      onChanged: (value) {
//                        titleInput = value; //Записываем в переменную текст
//                      }, //
            ),
            //Ввод данных пользователя
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
//                      onChanged: (val) {
//                        val = amountInput;
//                      },
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: () {
                logicForButton(titleController.text, double.parse(amountController.text));
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
