import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ToastUtils {
  static displayErrorMessage(BuildContext context, String message,
      {FlushbarPosition position = FlushbarPosition.BOTTOM}) {
    Flushbar(
      message: message,
      backgroundColor: Colors.red,
      flushbarPosition: position,
      icon: Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red[300],
      ),
      duration: const Duration(seconds: 5),
      leftBarIndicatorColor: Colors.red[300],
    ).show(context);
  }

  static displaySuccessMessage(BuildContext context, String message,
      {FlushbarPosition position = FlushbarPosition.BOTTOM}) {
    Flushbar(
      message: message,
      backgroundColor: Colors.green,
      flushbarPosition: position,
      duration: const Duration(seconds: 5),
    ).show(context);
  }
}
