import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  CharBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox( //Сокращает/Подгоняет размеры текста в размеры чилда. Text - you ara not grow anyway
            child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1.0),
                  color: Color.fromARGB(220, 220, 220, 1),
                  //можно создать свой цвет,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
