// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction);

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if(sameDay && sameYear && sameMonth) {
          totalSum += recentTransaction[i].value;
        }
      }

      return { 
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.fromLTRB(10, 15, 10 , 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactions.map((tr) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              label: tr['day'], 
              value: tr['value'],
              percentage: _weekTotalValue == 0 ? 0.0 : tr['value'] / _weekTotalValue, 
            ),
          );
      }).toList(),
      ),
    );
  }
}
