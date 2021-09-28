import 'package:flutter/material.dart';

mixin TextStyles {
  static TextStyle weak() {
    return TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 12,
        fontWeight: FontWeight.normal,
    );
  }

  static TextStyle danger() {
    return const TextStyle(
      color: Colors.red,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle strong() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle header1() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle header2() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.normal,
    );
  }
}
