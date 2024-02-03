import 'package:flutter/material.dart';

class TextStyleHelper {
  static hlText({Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static lgText({Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static mdText({Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? Colors.black,
    );
  }
}
