import 'package:flutter/material.dart';
import 'package:iug_flutter_1/iug_todo_app/data/data_source.dart';
import 'package:iug_flutter_1/iug_todo_app/models/todo.dart';

class NewTaskScreen extends StatelessWidget {
  Function function;
  NewTaskScreen(this.function);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task Screen"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () {
                DataSource.myTasks.add(Todo(controller.text));
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text(
                            "New Task has been added, press on ok to return to main page"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                function();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: Text("ok")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("add another task"))
                        ],
                      );
                    });
              },
              child: Text("Add New Task"))
        ],
      ),
    );
  }
}
