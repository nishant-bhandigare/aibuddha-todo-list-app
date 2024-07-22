import 'package:flutter/material.dart';

import 'task_widget.dart';

class TaskSection extends StatelessWidget {
  final String sectionTitle;
  final List tasks;

  const TaskSection({
    super.key,
    required this.sectionTitle,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Text(
            sectionTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        ...tasks.map((task) => TaskWidget(taskItem: task)),
      ],
    );
  }
}
