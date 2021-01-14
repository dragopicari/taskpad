import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String alertTitle;
  final String alertDescription;
  final bool isErrorAlert;

  const CustomAlert({
    @required this.alertTitle,
    @required this.alertDescription,
    @required this.isErrorAlert,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              decoration: new BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.clear_circled,
                  size: 40,
                  color: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                top: alertDescription.length > 40 ? 5.0 : 30,
                right: 8.0,
              ),
              child: Text(
                alertDescription,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.blueGrey[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "okay",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
