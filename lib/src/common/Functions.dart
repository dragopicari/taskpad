import 'package:taskpad/src/common/widget/CustomAlert.dart';
import 'package:flutter/material.dart';

class Functions {
  static Future<void> returnDialog(
    BuildContext context,
    String description,
    bool isErrorAlert,
  ) async {
    await showDialog(
      context: context,
      child: CustomAlert(
        alertTitle: "Oops, something went wrong",
        alertDescription: description,
        isErrorAlert: isErrorAlert,
      ),
    );
  }

  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  static void redirect(BuildContext context, dynamic page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static Future<String> selectTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String time =
          pickedTime.hour.toString() + ":" + pickedTime.minute.toString();

      return time;
    } else {
      return "";
    }
  }
}
