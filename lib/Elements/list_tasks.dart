// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:task_app/providers/task_list_provider.dart';

class ListTask extends StatefulWidget {
  const ListTask({Key? key}) : super(key: key);

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 10),
        itemCount: context.watch<TaskList>().count,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              tileColor: Colors.grey[200],
              title: Text(context.watch<TaskList>().tasksList[index].title),
              subtitle:
                  Text(context.watch<TaskList>().tasksList[index].description),
            ),
          );
        },
      ),
    );
  }
}
