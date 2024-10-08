import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

double getProportionateHeight(
    double px, {
      required BuildContext context,
      double figmaHeight = 800,
    }) {
  /// Calculate the proportional height based on the figmaHeight and current screen height
  return (px / figmaHeight) * MediaQuery.of(context).size.height;
}

double getProportionateWidth(
    double px, {
      required BuildContext context,
      double figmaWidth = 360,
    }) {
  /// Calculate the proportional width based on the figmaWidth and current screen width
  return (px / figmaWidth) * MediaQuery.of(context).size.width;
}

/// email validator
final RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

/// Capital letter check
final RegExp capital = RegExp(r'[A-Z]');

/// Special character check
final RegExp special = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

/// Number check
final RegExp number = RegExp(r'\d');

/// display toast error
// void showToast({required String message}) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.red,
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }
