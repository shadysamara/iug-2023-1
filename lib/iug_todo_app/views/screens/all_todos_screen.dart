import 'package:flutter/material.dart';
import 'package:iug_flutter_1/iug_todo_app/data/data_source.dart';
import 'package:iug_flutter_1/iug_todo_app/views/screens/new_task_screen.dart';
import 'package:iug_flutter_1/iug_todo_app/views/widgets/todo_widget.dart';

class AllTodoScreen extends StatelessWidget {
  Function function;
  Function function2;
  AllTodoScreen(this.function,this.function2);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: DataSource.myTasks.length,
              itemBuilder: (context, index) {
                return TodoWidget(DataSource.myTasks[index], function, function2);
              }),
        ),
              ElevatedButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return NewTaskScreen(function);
            }));
          }),
      ],
    );
  }
}
