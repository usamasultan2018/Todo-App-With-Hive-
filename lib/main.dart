import 'package:flutter/material.dart';
import 'package:todo_app_hive/screens/task_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  /// init the hive
   await Hive.initFlutter();
   /// Open a Box
   var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:const TaskScreen(),
    );
  }
}
