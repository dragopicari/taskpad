import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/common/widget/TextFormField.dart';
import 'package:taskpad/src/screens/HomeScreen.dart';
import 'package:taskpad/src/services.dart/providers/UserInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserData extends StatefulWidget {
  @override
  _AddUserDataState createState() => _AddUserDataState();
}

class _AddUserDataState extends State<AddUserData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _fullNameController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              mainTitle(size),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      isForTaskScreen: false,
                      inputController: _emailController,
                      obscuredText: false,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                      inputHint: "Insert your email",
                      isFinalInput: false,
                      actionToPerform: null,
                      bgColor: Colors.grey[200],
                      hintColor: Colors.grey[400],
                      textFieldColor: Colors.blueGrey[700],
                    ),
                    CustomTextFormField(
                      isForTaskScreen: false,
                      inputController: _passwordController,
                      obscuredText: true,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      inputHint: "Insert your password",
                      isFinalInput: false,
                      actionToPerform: null,
                      bgColor: Colors.grey[200],
                      hintColor: Colors.grey[400],
                      textFieldColor: Colors.blueGrey[700],
                    ),
                    CustomTextFormField(
                      isForTaskScreen: false,
                      inputController: _usernameController,
                      obscuredText: false,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      inputHint: "Chose an username",
                      isFinalInput: false,
                      actionToPerform: null,
                      bgColor: Colors.grey[200],
                      hintColor: Colors.grey[400],
                      textFieldColor: Colors.blueGrey[700],
                    ),
                    CustomTextFormField(
                      isForTaskScreen: false,
                      inputController: _fullNameController,
                      obscuredText: false,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      inputHint: "Insert your full name",
                      isFinalInput: false,
                      actionToPerform: null,
                      bgColor: Colors.grey[200],
                      hintColor: Colors.grey[400],
                      textFieldColor: Colors.blueGrey[700],
                    ),
                    CustomTextFormField(
                      isForTaskScreen: false,
                      inputController: _genderController,
                      obscuredText: false,
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      inputHint: "Insert your gender",
                      isFinalInput: true,
                      actionToPerform: () {
                        submitForm(context);
                      },
                      bgColor: Colors.grey[200],
                      hintColor: Colors.grey[400],
                      textFieldColor: Colors.blueGrey[700],
                    ),
                  ],
                ),
              ),
              confirmButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget mainTitle(Size size) {
    return Container(
      width: size.width,
      height: 200,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Fill your data",
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmButton() {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 15),
          child: FloatingActionButton(
            onPressed: () {
              submitForm(context);
            },
            backgroundColor: Colors.amber,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  submitForm(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState.validate()) {
      Functions.returnDialog(
        context,
        "Please fill all the required field",
        true,
      );
    } else if (Functions.validateEmail(_emailController.text) == false) {
      Functions.returnDialog(
        context,
        "Please choose a valid email",
        true,
      );
    } else {
      context.read<UserInfoProvider>().setUserInfo(
          _emailController.text,
          _passwordController.text,
          _usernameController.text,
          _fullNameController.text,
          _genderController.text);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
