import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    // Step 4: Dispose of the controller when it's no longer needed
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String newTextTitle = '';

    return Padding(
      padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.lightBlue),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _textController,
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newtext) {
              newTextTitle = newtext;
            },
            decoration: const  InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Add task here',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.lightBlue)),
            onPressed: () {
              String taskinput = _textController.text;
              // final task= Task(name: newTextTitle);
              print(newTextTitle);
              Provider.of<TaskData>(context, listen: false).addTask(newTextTitle);
              Navigator.pop(context);
            },
            child: const Text(
              'Add',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
