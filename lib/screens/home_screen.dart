import 'package:flutter/material.dart';
import 'package:todolist_frontend/components/custom_appbar.dart';
import 'package:todolist_frontend/constants/colours.dart';
import 'package:todolist_frontend/screens/add_task.dart';
import 'package:todolist_frontend/components/task_section.dart';
import 'package:todolist_frontend/data/tasks_data.dart';
import 'package:todolist_frontend/models/task.dart';

import 'calender_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  final weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  final now = DateTime.now();

  void _addNewTask(Task newTask) {
    setState(() {
      pendingTasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColour,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CustomAppBar(
          leftIcon: Icons.grid_view_rounded,
          title: "${weekDays[now.weekday-1]}, ${now.day}",
          rightIcon: Icons.calendar_today_outlined,
          onLeftIconPressed: (){},
          onRightIconPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CalendarScreen(),));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskSection(
              sectionTitle: "Tasks",
              tasks: pendingTasks,
            ),
            TaskSection(
              sectionTitle: "In Progress",
              tasks: inProgressTasks,
            ),
            TaskSection(
              sectionTitle: "Completed",
              tasks: completedTasks,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.of(context).push<Task>(
            MaterialPageRoute(
              builder: (context) => const AddTask(),
            ),
          );
          if (newTask != null) {
            _addNewTask(newTask);
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
