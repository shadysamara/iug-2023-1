import 'package:flutter/material.dart';
import 'package:iug_flutter_1/iug_todo_app/data/data_source.dart';
import 'package:iug_flutter_1/iug_todo_app/models/todo.dart';
import 'package:iug_flutter_1/iug_todo_app/views/screens/all_todos_screen.dart';
import 'package:iug_flutter_1/iug_todo_app/views/screens/complete_todo_screen.dart';
import 'package:iug_flutter_1/iug_todo_app/views/screens/incomplete_todo_screen.dart';

class MainTasksScreen extends StatefulWidget {
  @override
  State<MainTasksScreen> createState() => _MainTasksScreenState();
}

class _MainTasksScreenState extends State<MainTasksScreen> {
  PageController controller = PageController();

  int pageIndex = 0;
  refreshMainScreen() {
    setState(() {});
  }

  removeTask(Todo todo) {
    DataSource.myTasks.remove(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (v) {
            controller.jumpToPage(v);
            pageIndex = v;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "All Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: "Complete Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.cancel), label: "InComplete Tasks")
          ]),
      appBar: AppBar(title: Text("Todo App")),
      body: PageView(
        controller: controller,
        children: [
          AllTodoScreen(refreshMainScreen, removeTask),
          CompleteTodoScreen(refreshMainScreen, removeTask),
          InCompleteTodoScreen(refreshMainScreen, removeTask)
        ],
      ),
    );
  }
}
