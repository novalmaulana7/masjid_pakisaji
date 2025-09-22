import 'package:flutter/material.dart';

Color defaultColor = Colors.black;
String fontPoppins = "Poppins";

Map<String, dynamic> bold() {
  return {"weight": FontWeight.w700};
}

Map<String, dynamic> semibold() {
  return {"weight": FontWeight.w600};
}

Map<String, dynamic> medium() {
  return {"weight": FontWeight.w500};
}

Map<String, dynamic> regular() {
  return {"weight": FontWeight.w400};
}

// REGULER
TextStyle regularHeading({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? regular();

  return TextStyle(
    fontSize: 20,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

TextStyle regularBody({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? regular();

  return TextStyle(
    fontSize: 14,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

TextStyle regularCaption({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? regular();

  return TextStyle(
    fontSize: 10,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

// MEDIUM
TextStyle mediumHeading({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? medium();

  return TextStyle(
    fontSize: 20,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

TextStyle mediumBody({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? medium();

  return TextStyle(
    fontSize: 14,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

TextStyle mediumCaption({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? medium();

  return TextStyle(
    fontSize: 10,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

// SEMIBOLD
TextStyle semiboldHeading({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? semibold();

  return TextStyle(
    fontSize: 20,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

TextStyle semiboldBody({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? semibold();

  return TextStyle(
    fontSize: 14,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

TextStyle semiboldCaption({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? semibold();

  return TextStyle(
    fontSize: 10,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}

// BOLD
TextStyle boldDisplay({Color? color, Map<String, dynamic>? weight}) {
  final setColor = color ?? defaultColor;
  final setWeight = weight ?? bold();

  return TextStyle(
    fontSize: 26,
    letterSpacing: 0.0,
    color: setColor,
    fontWeight: setWeight["weight"],
    fontFamily: 'Poppins',
  );
}
