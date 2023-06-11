import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList = [];
  /// reference of hive box
  final _myBox = Hive.box('myBox');
  // run this method if this is the first ever opening the app
  void createInitialData(){
  }
  // load the data from database
void loadData(){
    toDoList = _myBox.get('TODOLIST');
}
// update the database
void updateDataBase(){
    _myBox.put('TODOLIST', toDoList);
}


}