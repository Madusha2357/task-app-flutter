// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:task_app/Elements/list_tasks.dart';
import 'package:task_app/Elements/logo.dart';
import 'package:task_app/Elements/searchbar.dart';
import 'package:task_app/Models/list_item.dart';
import 'package:task_app/Theme/theme.dart';
import 'package:task_app/providers/task_list_provider.dart';

class TaskApp extends StatefulWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              currentTheme.toggleTheme();
            },
            icon: Icon(
              Icons.wb_sunny,
            ),
            color: Theme.of(context).backgroundColor,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Logo(),
              SizedBox(height: 0),
              SearchBar(),
              SizedBox(height: 15),
              Column(
                children: [
                  Text(
                    'All tasks',
                    style:
                        TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 15.0),
                  )
                ],
              ),
              SizedBox(height: 15),
              ListTask(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _displayTextInputDialog(context);
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blue[900],
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a Task'),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        // valueText = value;
                      });
                    },
                    controller: titleController,
                    decoration: InputDecoration(hintText: "Title"),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        // valueText = value;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    controller: descriptionController,
                    decoration: InputDecoration(hintText: "Description"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('CANCEL'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    addNewListItem(
                        titleController.text, descriptionController.text);
                    Navigator.pop(context);
                  });
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void addNewListItem(String title, String description) {
    ListItem listItem = ListItem(title, description, "10.20.2012");
    context.read<TaskList>().addItem(listItem);
  }
}
