// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {

  AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChanged,
  });

  final DateTime selectedDate;
  final Function (DateTime) onDateChanged; 
  
_showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
    ? SizedBox(
      height: 180,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime.now(),
        maximumDate: DateTime.now(),
        minimumDate: DateTime(2019),
        onDateTimeChanged: onDateChanged,
    
      ),
    )
    : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Data selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}',
                  ),
                  TextButton(
                    onPressed: () => _showDatePicker(context),
                    child: const Text(
                      'Selecionar data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              );
  }
}