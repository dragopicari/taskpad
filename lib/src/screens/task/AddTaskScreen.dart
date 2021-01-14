import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/common/widget/TextFormField.dart';
import 'package:taskpad/src/services.dart/providers/TaskProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            isForTaskScreen: true,
            inputController: _taskController,
            obscuredText: false,
            inputType: TextInputType.name,
            inputAction: TextInputAction.done,
            inputHint: "Add a task..",
            isFinalInput: true,
            actionToPerform: () {
              FocusScope.of(context).unfocus();
            },
            bgColor: Colors.grey[200],
            hintColor: Colors.grey[400],
            textFieldColor: Colors.blueGrey[700],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(
                taskProvider.date != "" ? taskProvider.date : "Select day",
                Icons.calendar_today,
                () {
                  taskProvider.selectDate(context);
                },
                Colors.amber[700].withOpacity(0.5),
                EdgeInsets.only(left: 20.0),
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              button(
                taskProvider.time != "" ? taskProvider.time : "Select time",
                Icons.timer,
                () async {
                  String time = await Functions.selectTime(context);

                  taskProvider.setTime(time);
                },
                Colors.green[700].withOpacity(0.5),
                EdgeInsets.only(right: 20),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add_circled),
        backgroundColor: Colors.blueGrey[900],
        onPressed: () {
          taskProvider.submitForm(context, _taskController.text);
        },
      ),
    );
  }

  Widget button(String title, IconData icon, VoidCallback action, Color color,
      EdgeInsetsGeometry padding) {
    return Expanded(
      child: Padding(
        padding: padding,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          child: GestureDetector(
            onTap: () {
              action();
            },
            child: Container(
              height: 50,
              decoration: new BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
