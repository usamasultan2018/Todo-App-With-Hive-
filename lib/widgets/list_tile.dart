import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskTitle;
  final String subTitle;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile(
      {Key? key,
      required this.taskTitle,
      required this.subTitle,
      required this.onChanged,
      required this.deleteFunction,
      required this.taskCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Slidable(

        endActionPane: ActionPane(
          extentRatio: 0.4,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.red,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(value: taskCompleted, onChanged: onChanged),
                  Text(
                    taskTitle,
                    style: TextStyle(
                        color: taskCompleted ? Colors.red : Colors.white,
                        decoration:
                            taskCompleted ? TextDecoration.lineThrough : null),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  subTitle,
                  style: TextStyle(
                      color: taskCompleted ? Colors.black : Colors.white,
                      decoration:
                      taskCompleted ? TextDecoration.lineThrough : null),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// leading: Checkbox(value: taskCompleted, onChanged: onChanged),
// title: Text(
// taskTitle,
// style: TextStyle(
// color: taskCompleted ? Colors.red : Colors.white,
// decoration: taskCompleted ? TextDecoration.lineThrough : null),
// ),
// subtitle: Text(
// subTitle,
// style: TextStyle(
// color: taskCompleted ? Colors.black : Colors.white,
// decoration: taskCompleted ? TextDecoration.lineThrough : null),
// ),
