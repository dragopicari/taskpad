import 'package:taskpad/src/common/Functions.dart';
import 'package:taskpad/src/models/Task.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _listOfTasks = [];
  List<Task> _totalTasksCompleted = [];

  List<Task> get listOfTasks => _listOfTasks;
  List<Task> get completed => _totalTasksCompleted;

  setTasks(Task task) {
    _listOfTasks.add(task);
    notifyListeners();
  }

  String _date = "";

  String get date => _date;

  String _time = "";

  String get time => _time;

  setDate(String newDate) {
    _date = newDate;
    notifyListeners();
  }

  setTime(String newTime) {
    _time = newTime;
    notifyListeners();
  }

  clearTimeDate() {
    _date = "";
    _time = "";
  }

  deleteTask(Task task) {
    listOfTasks.remove(task);
    completed.remove(task);
    notifyListeners();
  }

  addCompletedTask(Task task) {
    completed.add(task);
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      String date = picked.day.toString() +
          "/" +
          picked.month.toString() +
          "/" +
          picked.year.toString();

      setDate(date);
    }
  }

  void submitForm(
    BuildContext context,
    String task,
  ) {
    if (task.length == 0) {
      Functions.returnDialog(
        context,
        "Please add a task before continue",
        true,
      );
    } else if (date == "") {
      Functions.returnDialog(
        context,
        "Please select a date",
        true,
      );
    } else if (time == "") {
      Functions.returnDialog(
        context,
        "Please select a time",
        true,
      );
    } else {
      Task newTask = Task(task, time, date, false);
      setTasks(newTask);
      clearTimeDate();
      Navigator.pop(context);
    }
  }
}
