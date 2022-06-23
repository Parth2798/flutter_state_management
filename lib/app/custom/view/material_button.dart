import 'package:flutter/material.dart';

Widget getMaterialButton(
    {required VoidCallback onPressed,
    required String text,
    double elevation = 0,
    Color color = Colors.black54,
    double radius = 5,
    double width = double.minPositive,
    TextStyle? style}) {
  return MaterialButton(
    minWidth: width,
    elevation: elevation,
    color: color,
    shape: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    child: new Text(text, style: style),
    onPressed: onPressed,
  );
}
