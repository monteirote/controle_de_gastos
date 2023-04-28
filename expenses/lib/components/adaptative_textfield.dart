// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {

  const AdaptativeTextField({
    required this.controller,
    required this.label,
    required this.onSubmit
  });

  final TextEditingController controller;
  final String label;
  final void Function() onSubmit;
  


  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
    ? CupertinoTextField(
        controller: controller,
        onSubmitted: (_) => onSubmit,
        placeholder: label,
    )
    : TextField(
      controller: controller,
      onSubmitted: (_) => onSubmit,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}