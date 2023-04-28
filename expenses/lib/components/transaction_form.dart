// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_textfield.dart';
import 'adaptative_datepicker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _valueController = TextEditingController();

  _submitForm() {
    final title = _titleController.text;
    final value = double.parse(_valueController.text);

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                label: 'Título',
                onSubmit: () {},
              ),
              SizedBox(
                height: 10,
              ),
              AdaptativeTextField(
                controller: _valueController,
                onSubmit: _submitForm,
                label: 'Valor (R\$)',
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate, 
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                }
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
