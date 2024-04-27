import 'package:bmiator/shared/indicators/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils{

  static void showLoading(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false, //to prevent user from closing the dialog
      builder: (context) =>  PopScope(
        canPop: false, //to prevent user from closing the dialog
        child: AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height *0.2,
              child: const LoadingIndicator(),
          ),
        ),
      ),
  );

  static void hideLoading(BuildContext context) => Navigator.pop(context);

  static void showMessage(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );

}