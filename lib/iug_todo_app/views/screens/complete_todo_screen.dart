import 'package:flutter/material.dart';
import 'package:iug_flutter_1/iug_todo_app/data/data_source.dart';
import 'package:iug_flutter_1/iug_todo_app/views/widgets/todo_widget.dart';

class CompleteTodoScreen extends StatelessWidget {
  Function function;
    Function function2;
  CompleteTodoScreen(this.function,this.function2);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
     DataSource.myTasks.where((element) => element.isComplete).length==0?
     Center(child: Text("no complete tasks found"),):
    
    ListView.builder(
        itemCount:
            DataSource.myTasks.where((element) => element.isComplete).length,
        itemBuilder: (context, index) {
          return TodoWidget(
              DataSource.myTasks
                  .where((element) => element.isComplete)
                  .toList()[index],
              function,function2);
        });
  }
}
