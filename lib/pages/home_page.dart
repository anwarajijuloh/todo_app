import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/my_alertdialog.dart';

import '../utils/my_addtodo.dart';
import '../utils/my_appbar.dart';
import '../utils/my_header.dart';
import '../utils/my_listitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("myBox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    
    if (_myBox.get("TODOLIST") == null){
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _todoController = TextEditingController();

  int _countDone = 0;

  void completeTodo(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      _countDone = db.toDoList.where((element) => element[1] == true).length;
    });
    db.updateDataBase();
  }

  void addNewTask() {
    setState(() {
      db.toDoList.add([_todoController.text, false]);
      _todoController.clear();
    });
    db.updateDataBase();
  }

  void editTask(int index) {
    String editedText = db.toDoList[index][0];
    showDialog(
      context: context,
      builder: (context) => MyAlertDialog(
        title: "Edit Task",
        myEditText: TextEditingController()..text = editedText,
        myOnChanged: (value) => editedText = value,
        txtButton: "Save",
        isRead: false,
        onAction: () {
          setState(() {
            db.toDoList[index][0] = editedText;
          });
          db.updateDataBase();
          Navigator.pop(context);
        },
      ),
    );
  }

  void deleteTask(int index) {
    String txtDelete = db.toDoList[index][0];
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertDialog(
            title: "Are you sure?\nto delete this task",
            myEditText: TextEditingController()..text = txtDelete,
            myOnChanged: (value){},
            txtButton: "Delete",
            isRead: true,
            onAction: (){
              setState(() {
                db.toDoList.removeAt(index);
              });
              db.updateDataBase();
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ListView.builder(
          itemCount: db.toDoList.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return MyHeader(
                todoDone: '$_countDone/${db.toDoList.length}',
              );
            } else if (index == 1) {
              return MyAddTodo(
                todoController: _todoController,
                addTodo: addNewTask,
              );
            } else {
              return MyListItem(
                textTodo: db.toDoList[index - 2][0],
                completed: db.toDoList[index - 2][1],
                onTap: (value) => completeTodo(value, index - 2),
                onEdit: () => editTask(index - 2),
                onDelete: () => deleteTask(index - 2),
              );
            }
          },
        ),
      ),
    );
  }
}
