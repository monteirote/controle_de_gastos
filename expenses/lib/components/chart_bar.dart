// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final value;
  final percentage;

  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.125,
              child: FittedBox(
                child: Text(
                  '${value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            SizedBox(
                height: constraints.maxHeight * 0.70,
                width: 20,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          color: Color.fromRGBO(220, 220, 220, 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Color.fromRGBO(43, 152, 83, 1)),
                            color: Color.fromRGBO(97, 205, 90, 1),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                )),
            SizedBox(height: constraints.maxHeight * 0.03),
            SizedBox(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
