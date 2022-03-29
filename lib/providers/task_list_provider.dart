import 'package:flutter/material.dart';
import 'package:task_app/Models/list_item.dart';

class TaskList with ChangeNotifier {
  List<ListItem> tasksList = [];

  int get count => tasksList.length;
  List<ListItem> get tasks => tasksList;

  void addItem(ListItem item) {
    tasksList.add(item);
    notifyListeners();
  }
}
