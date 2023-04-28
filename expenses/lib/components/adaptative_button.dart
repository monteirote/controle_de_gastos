// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {

  final String label;
  final void Function() onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoButton(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
        color: const Color.fromRGBO(97, 205, 90, 1),
        onPressed: onPressed,
        child: Text(
          label),
      )
    : ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(127, 127, 127, 127)
      ),
      onPressed: () => onPressed,
      child: Text(label),
    );
  }
}