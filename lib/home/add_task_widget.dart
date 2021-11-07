import 'package:flutter/material.dart';
import 'package:todo_sun_c4/data/FirebaseUtils.dart';

class AddTaskWidget extends StatefulWidget {
  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            textAlign: TextAlign.center,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter todo title";
                    }
                    return null;
                  },
                  onChanged: (newValue) {
                    title = newValue;
                  },
                ),
                TextFormField(
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Details',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter todo details";
                    }
                    return null;
                  },
                  onChanged: (newValue) {
                    description = newValue;
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Select Date'),
          ),
          InkWell(
            onTap: () {
              showCalendar();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addTodo();
              },
              child: Text('Add Task'))
        ],
      ),
    );
  }

  void addTodo() {
    if (formKey.currentState!.validate() == true) {
      // add todo
      addTodoToFirebase(title, description, selectedDate).then((value) {
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        print(error.toString());
      }).timeout(Duration(seconds: 30), onTimeout: () {
        print('timeout');
      });
    }
  }

  void showCalendar() async {
    var newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      setState(() {});
    }
  }
}
