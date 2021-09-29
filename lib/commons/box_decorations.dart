import 'package:flutter/material.dart';

/*
 * These are generic methods, predefined to be able to used by whole app
 */
mixin BoxDecorations {
  static BoxDecoration circle(Color backgroundColor, [double width = 1]) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: backgroundColor,
      border: Border.all(color: Colors.white, width: width),
    );
  }

  static BoxDecoration rectangle(Color backgroundColor, [double radius = 15]) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius));
  }

  static BoxDecoration gradient() {
    return const BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(2, 175, 192, 1),
        Color.fromRGBO(1, 93, 118, 1),
      ],
    ));
  }
}
