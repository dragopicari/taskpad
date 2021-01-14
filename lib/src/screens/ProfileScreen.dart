import 'package:taskpad/src/common/Colors.dart';
import 'package:taskpad/src/models/UserInfo.dart';
import 'package:taskpad/src/services.dart/providers/BottomBarValueProvider.dart';
import 'package:taskpad/src/services.dart/providers/UserInfoProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserInfo userdata = Provider.of<UserInfoProvider>(context).userInfo;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.read<BottomBarValueProvider>().setIndex(2);

            Navigator.pop(context);
          },
        ),
        backgroundColor: deepGrey,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                decoration: new BoxDecoration(
                  gradient: violetGradient,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Account Info",
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5,
                  child: Column(
                    children: [
                      userData(
                        "Email : ",
                        userdata.email,
                        CupertinoIcons.mail,
                      ),
                      userData(
                        "Password : ",
                        userdata.password,
                        CupertinoIcons.lock_circle,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5,
                  child: Column(
                    children: [
                      userData(
                        "Username : ",
                        userdata.username,
                        CupertinoIcons.rectangle_stack_person_crop,
                      ),
                      userData(
                        "Full Name : ",
                        userdata.fullName,
                        Icons.text_fields,
                      ),
                      userData(
                        "Gender : ",
                        userdata.gender,
                        CupertinoIcons.person_circle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 120,
            margin: EdgeInsets.only(
              top: 60,
            ),
            decoration: new BoxDecoration(
              border: Border.all(width: 3, color: deepGrey),
              shape: BoxShape.circle,
              color: Colors.grey[200],
              // image: new DecorationImage(
              //   image: NetworkImage(
              //       "https://apey.org/wp-content/themes/apey-theme/images/logo.png"),
              //   fit: BoxFit.scaleDown,
              // ),
            ),
            child: Center(
              child: Icon(CupertinoIcons.person_alt_circle, size: 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget userData(String dataLeading, String data, IconData iconType) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              iconType,
              size: 23,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: dataLeading,
                    style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: data,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
