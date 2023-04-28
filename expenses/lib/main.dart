// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'dart:io';
import 'dart:math';

import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Color.fromRGBO(97, 205, 90, 1),
            secondary: Color.fromRGBO(97, 205, 90, 1),
          ),
          textTheme: tema.textTheme.copyWith(
            titleLarge: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      date: date,
      title: title,
      value: value,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: <Widget>[TransactionForm(_addTransaction)],
        );
      },
    );
  }

  Widget _getIconButton(IconData icon, void Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList =
        Platform.isIOS ? CupertinoIcons.arrow_2_squarepath : Icons.list;
    final chartList =
        Platform.isIOS ? CupertinoIcons.arrow_2_squarepath : Icons.show_chart;

    final actions = <Widget>[
      if (isLandscape)
        _getIconButton(
          _showChart ? iconList : chartList,
          () => {
            setState(() {
              _showChart = !_showChart;
            })
          },
        ),
      SizedBox(
        width: 20,
      ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];

    final Widget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            backgroundColor: Color.fromRGBO(97, 205, 90, 1),
            middle: Text(
              'Despesas Pessoais',
              style:
                TextStyle(
                  color: Color.fromRGBO(14, 14, 14, 1,), 
                  fontSize: 22
                ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions
            )
          )
        : AppBar(
            title: Text(
              'Despesas Pessoais',
              style: TextStyle(
                fontSize: 23 * mediaQuery.textScaleFactor,
              ),
            ),
            actions: actions,
            centerTitle: false,
          );

    final availableHeight = mediaQuery.size.height - mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (_showChart || !isLandscape)
            Container(
              height: availableHeight * (isLandscape ? 0.83 : 0.3),
              child: Chart(_recentTransactions),
            ),
          if (!_showChart || !isLandscape)
            SingleChildScrollView(
              child: Container(
                height: isLandscape
                    ? availableHeight * 0.83
                    : availableHeight * 0.6,
                child: TransactionList(_transactions, _deleteTransaction),
              ),
            ),
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar as ObstructingPreferredSizeWidget, body: bodyPage);
  }
}
