import 'package:flutter/material.dart';

import '../components/custom_appbar.dart';
import '../components/date_time_range_picker.dart';
import '../constants/colours.dart';
import '../models/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _form = GlobalKey<FormState>();
  String _taskName = '';
  String _taskDescription = '';
  List<DateTime> dateTimeList = [];

  void saveTask() {
    if (_form.currentState!.validate() && dateTimeList != []) {
      _form.currentState!.save();
      final newTask = Task(
        taskName: _taskName,
        taskDescription: _taskDescription,
        dateTime: dateTimeList[0],
        endDateTime: dateTimeList[1],
        status: TaskStatus.pending,
      );
      Navigator.of(context).pop(newTask); // Return the new task
    } else {
      print("Error in saveTask");
    }
  }

  void setDateTimeList(List<DateTime> temp) {
    dateTimeList = temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColour,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CustomAppBar(
          leftIcon: Icons.arrow_back,
          title: "Create New Task",
          rightIcon: Icons.check,
          onLeftIconPressed: (){
            Navigator.of(context).pop();
          },
          onRightIconPressed: (){
            saveTask();
          },
        ),
      ),
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // taskName text-field
                TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widgetColour, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widgetColour, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Task Name",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a task name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _taskName = value!;
                  },
                ),

                const SizedBox(height: 10),

                // taskDescription text-field
                TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widgetColour, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widgetColour, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a task description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _taskDescription = value!;
                  },
                ),

                const SizedBox(height: 20),

                DateTimeRangePicker(setDateTimeList: setDateTimeList),

                const SizedBox(height: 10),

                // InkWell(
                //   onTap: () {
                //     saveTask();
                //   },
                //   child: Container(
                //     width: 80,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: widgetColour,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: const Center(
                //       child: Icon(Icons.add),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
