import 'package:apey/src/common/Colors.dart';
import 'package:apey/src/models/UserInfo.dart';
import 'package:apey/src/services.dart/providers/BottomBarValueProvider.dart';
import 'package:apey/src/services.dart/providers/TaskProvider.dart';
import 'package:apey/src/services.dart/providers/UserInfoProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTaskScreen.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserInfo userInfo = Provider.of<UserInfoProvider>(context).userInfo;
    TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteAmber,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name(userInfo),
                messageWelcome(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30.0,
                                top: 20.0,
                                right: 30.0,
                              ),
                              child: Container(
                                width: size.width,
                                decoration: new BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black45.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Your tasks",
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: taskProvider.listOfTasks.isNotEmpty
                                  ? showTasks(taskProvider)
                                  : Center(
                                      child: Text("No tasks to show ..."),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: deepGrey,
                ),
                onPressed: () {
                  context.read<BottomBarValueProvider>().setIndex(2);
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 80,
                      width: size.width / 1.2,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.amber[700].withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.blueGrey,
                          ),
                          child: Center(
                            child: Text(
                              "Add new Task",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showTasks(TaskProvider taskProvider) {
    return ListView.builder(
      itemCount: taskProvider.listOfTasks.length,
      itemBuilder: (context, index) {
        return Container(
          color:
              taskProvider.completed.contains(taskProvider.listOfTasks[index])
                  ? Colors.green[300]
                  : Colors.transparent,
          child: ListTile(
            title: Text(taskProvider.listOfTasks[index].task),
            subtitle: Text(taskProvider.listOfTasks[index].day +
                "  " +
                taskProvider.listOfTasks[index].time),
            trailing: IconButton(
              icon: taskProvider.completed
                      .contains(taskProvider.listOfTasks[index])
                  ? Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red[200],
                    )
                  : Icon(
                      Icons.check_box,
                      size: 30,
                      color: Colors.greenAccent,
                    ),
              onPressed: () {
                if (taskProvider.completed
                    .contains(taskProvider.listOfTasks[index])) {
                  taskProvider.deleteTask(taskProvider.listOfTasks[index]);
                } else {
                  taskProvider
                      .addCompletedTask(taskProvider.listOfTasks[index]);
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget name(UserInfo userInfo) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 70, bottom: 5.0),
      child: Text(
        userInfo.fullName.substring(0, 1).toUpperCase() +
            userInfo.fullName.substring(1),
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget messageWelcome() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Text(
        "Welcome to your daily plan",
        style: TextStyle(
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
