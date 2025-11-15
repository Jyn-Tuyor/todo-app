import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final Function(int) deleteTask;
  final int index;

  const TodoCard({
    super.key,
    required this.taskName,
    required this.isCompleted,
    this.onChanged,
    required this.deleteTask,
    required this.index
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 44, 52, 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox.adaptive(value: widget.isCompleted, onChanged: widget.onChanged),
            Text(
              widget.taskName,
              style: TextStyle(
                decoration: widget.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                decorationColor:
                    Colors.black, // Optional: customize underline color
                decorationThickness:
                    5.0, // Optional: customize underline thickness
                decorationStyle: TextDecorationStyle.wavy,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton.filledTonal(
              onPressed: () => widget.deleteTask(widget.index),
              icon: Icon(Icons.delete_outline_sharp)
            )
          ],
        ),
      ),
    );
  }
}
