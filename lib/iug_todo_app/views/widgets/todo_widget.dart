import 'package:flutter/material.dart';
import 'package:iug_flutter_1/iug_todo_app/models/todo.dart';

class TodoWidget extends StatefulWidget {
  Todo todo;
  Function fun;
  Function removeFun;
  TodoWidget(this.todo, this.fun, this.removeFun);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: IconButton(
          onPressed: () {
            widget.removeFun(widget.todo);
          },
          icon: Icon(Icons.delete)),
      trailing: Checkbox(
        value: widget.todo.isComplete,
        onChanged: (v) {
          widget.todo.isComplete = !widget.todo.isComplete;
          setState(() {});
          widget.fun();
        },
      ),
      title: Text(widget.todo.name),
    );
  }
}
