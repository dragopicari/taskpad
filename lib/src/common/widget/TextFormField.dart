import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isForTaskScreen;
  final TextEditingController inputController;
  final bool obscuredText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String inputHint;
  final bool isFinalInput;
  final VoidCallback actionToPerform;
  final Color bgColor;
  final Color hintColor;
  final Color textFieldColor;

  const CustomTextFormField({
    @required this.isForTaskScreen,
    @required this.inputController,
    @required this.obscuredText,
    @required this.inputType,
    @required this.inputAction,
    @required this.inputHint,
    @required this.isFinalInput,
    @required this.actionToPerform,
    @required this.bgColor,
    @required this.hintColor,
    @required this.textFieldColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 15),
      child: Container(
        height: isForTaskScreen ? 250 : 50,
        decoration: new BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: Colors.blueGrey[900].withOpacity(0.2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: TextFormField(
          maxLines: isForTaskScreen ? null : 1,
          controller: inputController,
          obscureText: obscuredText,
          keyboardType: inputType,
          textInputAction: inputAction,
          style: TextStyle(color: textFieldColor),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: inputHint,
            hintStyle: TextStyle(color: hintColor),
            errorBorder: InputBorder.none,
            errorStyle: TextStyle(color: Colors.transparent, height: 0),
            contentPadding: EdgeInsets.only(left: 8.0),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "";
            }
            return null;
          },
          onEditingComplete: () {
            if (isFinalInput) {
              actionToPerform();
            }
          },
        ),
      ),
    );
  }
}
