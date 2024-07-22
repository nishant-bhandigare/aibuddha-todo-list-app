import 'package:flutter/material.dart';
import 'package:todolist_frontend/constants/colours.dart';

import '../models/task.dart';

class TaskWidget extends StatefulWidget{
  const TaskWidget({super.key, required this.taskItem});
  final Task taskItem;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: widgetColour,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Radio<int>(
            value: 0,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          Text(widget.taskItem.taskName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}