import 'package:flutter/material.dart';

class AddTaskWidget extends StatefulWidget {
  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
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
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            minLines: 5,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Details',
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
                '12/2/2020',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Add Task'))
        ],
      ),
    );
  }

  void showCalendar() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
  }
}
