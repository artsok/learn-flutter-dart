import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function logicForButton;

  NewTransaction(this.logicForButton);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final entredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (entredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    //this code NO Rich
    widget.logicForButton(entredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  //Show date picker
  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedData) {
      if (pickedData == null) {
        //Если дата не выбрана
        return;
      }

      //Statefull trigger update and need to run again. Как только обновили информацию нужно перерисовать
      setState(() {
        _selectedDate = pickedData;
      });
    }); //then вызоветься когда пользователь выберет дату
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
              controller: _titleController,
              onSubmitted: (_) => _submitData,
            ),
            //Ввод данных пользователя
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No Date Choosen!"
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "Choose Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            //FlatButton( //Прозрачная кнопка
            RaisedButton(
              //Кнопка с фоном
              child: Text("Add Transaction"),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                _submitData();
                print("${_titleController.text}  ${_amountController.text}");
              },
            )
            //Ввод данных пользователя
          ],
        ),
      ),
    );
  }
}
