import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_hive/Data/database.dart';
import 'package:todo_app_hive/widgets/alert_box.dart';
import 'package:todo_app_hive/widgets/list_tile.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
   if(_myBox.get('TODOLIST') == null){
     db.createInitialData();
   }
   else{
     db.loadData();
   }
    super.initState();
  }
  var titleTask =TextEditingController();
  var desTask = TextEditingController();
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();
  void saveAddTask(){
    setState(() {
      db.toDoList.add([titleTask.text,desTask.text,false]);
    });

     print(db.toDoList);
    Navigator.pop(context);
    db.updateDataBase();
  }
  void createNewTask() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertBox(
            titleController: titleTask,
            addSaveTask: saveAddTask,
            onCancel: ()=>Navigator.pop(context),
            descriptionController: desTask,
          );
        });
    db.updateDataBase();
  }



  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] =! db.toDoList[index][2];
    });
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      print(index);
    });
    db.updateDataBase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('TO DO List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskTitle: db.toDoList[index][0],
                  subTitle: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChange(value, index),
                  deleteFunction: (context) =>
                      deleteTask(index),
                  taskCompleted: db.toDoList[index][2],
                );
              })),
    );
  }
}
