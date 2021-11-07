import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_sun_c4/data/FirebaseUtils.dart';
import 'package:todo_sun_c4/data/Todo.dart';

class TaskItem extends StatelessWidget {
  Todo item;

  TaskItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        color: Colors.red,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Container(
          color: Colors.white,
          child: Container(
            height: 120,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.white),
            child: Row(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(item.description,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline2)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: ImageIcon(
                    AssetImage('assets/images/ic_check.png'),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconSlideAction(
          color: Colors.transparent,
          iconWidget: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, color: Colors.white),
                Text(
                  'Delete',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          onTap: () {
            deleteTask(item)
                .onError((error, stackTrace) {})
                .then((value) {})
                .timeout(Duration(seconds: 30), onTimeout: () {});
          },
        )
      ],
    );
  }
}
