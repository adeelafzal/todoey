import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:flutter_alert/flutter_alert.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {

                showAlert(
                  context: context,
                  title: "Delete task?",
                  body: "Do you want to delete this task?",
                  actions: [
                    AlertAction(
                      text: "Delete",
                      isDestructiveAction: true,
                      onPressed: () {
                        taskData.deleteTask(task);
                      },
                    ),
                  ],
                  cancelable: true,
                );
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }

  void DeleteTask(){

  }

}