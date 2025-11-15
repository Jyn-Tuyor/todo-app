import 'package:flutter/material.dart';
import 'package:todo_application/widgets/todo_card.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List todos = [
    // ['Do laundry tommorow', false],
    // ['Learn flutter', false],
    // ['Build this todo app', false],
    // ['Eat a lot', false],
  ];

  final TextEditingController _controller = TextEditingController();

  void checkBoxOnChanged(index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });

  }

  void saveTask() {
    setState(() {
      todos.add([_controller.text, false]);
    });

    _controller.clear();

  }

  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.amber,
      ),
      home: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        appBar: AppBar(
          title: Text(
            '🍉 To do Tasks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // centerTitle: true,
          // foregroundColor: Colors.white,
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: todos.isEmpty
                    ? Center(
                        child: Text(
                          'Welcome to my Todo App! Please add a task as many as you\'d like!',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return TodoCard(
                            taskName: todos[index][0],
                            isCompleted: todos[index][1],
                            onChanged: (value) => checkBoxOnChanged(index),
                            deleteTask: deleteTask,
                            index: index,
                          );
                        },
                      ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Add a todo or something...',
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Color.fromRGBO(40, 44, 52, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 22.0,
                            vertical: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: () => saveTask(),
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 25.0,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    child: Icon(Icons.add_task_rounded, size: 19.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
