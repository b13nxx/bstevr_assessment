import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(radius)
    );
  }
}