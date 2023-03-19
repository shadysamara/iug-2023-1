import 'package:flutter/material.dart';
import 'package:iug_flutter_1/todo/models/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CheckboxListTile(value: task.isComplete, onChanged: (v) {},title: Text(task.name),);
  }
}
