import 'package:flutter/material.dart';

class TextStyleHelper {
  static ds({Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: 28,
      fontWeight: weight ?? FontWeight.w600,
      color: color ?? Colors.black,
      letterSpacing: 0,
    );
  }

  static hllText({Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: 28,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  static hlmText({Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: 22,
      fontWeight: weight ?? FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

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
