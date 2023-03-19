import 'package:flutter/material.dart';
import 'package:iug_flutter_1/todo/data/data_repository.dart';
import 'package:iug_flutter_1/todo/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: DataRepo.tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(DataRepo.tasks[index]);
        });
  }
}
