import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card( //Widget which build for the items!! For first, second,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 3)),
                  child: Text(
                    "\$${transactions[index].amount}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("yyyy-MM-dd").format(transactions[index].date), //Используем индексы
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                )
              ],
            ),
            //Widget build for itemN
          );
        },

        itemCount: transactions.length, //Number of items

//        children: transactions.map((it) {
//          return
//        }).toList(),
      ),);
  }
}
