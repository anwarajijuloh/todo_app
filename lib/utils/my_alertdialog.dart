import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class MyAlertDialog extends StatelessWidget {
  final TextEditingController myEditText;
  final Function(String)? myOnChanged;
  final Function() onAction;
  final String txtButton;
  final bool isRead;
  final String title;
  const MyAlertDialog(
      {super.key,
      required this.myEditText,
      required this.myOnChanged,
      required this.onAction,
      required this.txtButton,
      required this.isRead,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(30),
      title: Text(title, textAlign: TextAlign.center,),
      content: TextField(
        readOnly: isRead,
        controller: myEditText,
        onChanged: myOnChanged,
      ),
      actions: [
        TextButton(
          child: const Text(
            "Cancel",
            style: TextStyle(color: myOrange),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: onAction,
          child: Text(
            txtButton,
            style: const TextStyle(color: myGreen),
          ),
        ),
      ],
    );
  }
}
