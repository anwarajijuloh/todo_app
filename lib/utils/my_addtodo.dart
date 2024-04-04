import 'package:flutter/material.dart';

import '../constants.dart';

class MyAddTodo extends StatelessWidget {
  final TextEditingController todoController;
  final Function() addTodo;
  const MyAddTodo({super.key, required this.todoController, required this.addTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: todoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                fillColor: bgSecondary,
                filled: true,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'write your next task',
                hintStyle: TextStyle(
                  color: textSecondary,
                  fontSize: 12,
                ),
              ),
              style: const TextStyle(
                color: textPrimary,
                fontSize: 12,
              ),
              cursorColor: myOrange,
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            mini: true,
            onPressed: addTodo,
            child: const Icon(
              Icons.add_rounded,
            ),
          )
        ],
      ),
    );
  }
}
