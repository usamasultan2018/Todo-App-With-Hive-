import 'package:flutter/material.dart';
class AlertBox extends StatelessWidget {
  final titleController;
  final descriptionController;
  final VoidCallback addSaveTask;
  final VoidCallback onCancel;
  const AlertBox({Key? key,
    required this.titleController,
    required this.addSaveTask,
    required this.onCancel, this.descriptionController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Colors.purple,
      title: Column(
        children: [
          const Text('Add Task',style: TextStyle(fontSize: 30,color: Colors.white),),
          const SizedBox(height: 8,),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title. ',
              hintStyle: TextStyle(color:Colors.purple.shade200),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Description',
                hintStyle: TextStyle(color:Colors.purple.shade200),
                contentPadding: const EdgeInsets.all(10),

              ),
            ),
          )
        ],
      ),
      actions: [
        TextButton(onPressed:addSaveTask,
            child:const Text('Save',style: TextStyle(color: Colors.white))),
        TextButton(onPressed:onCancel,
        child:const Text('Cancel',style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
