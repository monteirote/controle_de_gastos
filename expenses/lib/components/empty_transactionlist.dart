// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class EmptyTransactionList extends StatelessWidget {
  
  
  const EmptyTransactionList({
    required this.ctx,
    required this.constraints,
  });

  final ctx;
  final constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
              children: <Widget>[
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                const DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  child: Text(
                    'Nenhuma transação cadastrada..',
                  ),
                ),
                Container(
                  height: constraints.maxHeight * 0.55,
                  margin: EdgeInsets.fromLTRB(
                      0, constraints.maxHeight * 0.15, 0, 0),
                  child: Image.asset(
                    'assets/images/waiting.png',
                  ),
                )
              ],
            );
          }
  
}