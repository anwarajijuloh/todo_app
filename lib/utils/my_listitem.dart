import 'package:flutter/material.dart';

import '../constants.dart';

class MyListItem extends StatelessWidget {
  final String textTodo;
  final Function(bool?)? onTap;
  final Function() onEdit;
  final Function() onDelete;
  final bool completed;
  const MyListItem({
    super.key,
    required this.textTodo,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: bgSecondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: textPrimary,
            width: 1.2,
          )),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: completed ? myGreen : bgSecondary,
              shape: BoxShape.circle,
              border:
                  completed ? null : Border.all(color: myOrange, width: 2.5),
            ),
            child: Checkbox(
              activeColor: myGreen,
              checkColor: myGreen,
              side: const BorderSide(width: 0, color: bgSecondary),
              value: completed,
              onChanged: onTap,
            ),
          ),
          Expanded(
            child: Text(
              textTodo,
              style: TextStyle(
                fontSize: 12,
                color: textPrimary,
                overflow: TextOverflow.ellipsis,
                decoration: completed ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          completed ? const SizedBox() : IconButton(
            icon: const Icon(Icons.edit_document),
            onPressed: onEdit,
            color: myGreen,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: onDelete,
            color: myOrange,
          ),
        ],
      ),
    );
  }
}
