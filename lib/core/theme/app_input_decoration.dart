import 'package:flutter/material.dart';

abstract class AppInputDecoration {
  static const InputDecoration underline = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1),
    ),
  );
}