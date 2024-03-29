import 'package:flutter/material.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function selectHandler;
  final Function onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.selectHandler,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          selectHandler();
          print('Clicked on List Tile');
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.white),
        ),
        tileColor: const Color.fromARGB(255, 31, 31, 32),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 17,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.red,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () {
            onDeleteItem();
            print('Clicked on delete icon');
          },
        ),
      ),
    );
  }
}
