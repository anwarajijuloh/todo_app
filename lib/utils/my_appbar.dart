import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

PreferredSizeWidget myAppBar() {
  return AppBar(
    title: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'ANWAR',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: textPrimary,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: 'TODO',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: myOrange,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.logout_rounded),
        onPressed: () {
          SystemNavigator.pop();
        },
      ),
    ],
  );
}
