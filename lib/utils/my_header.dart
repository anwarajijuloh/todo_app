import 'package:flutter/material.dart';

import '../constants.dart';

class MyHeader extends StatelessWidget {
  final String todoDone;
  const MyHeader({super.key, required this.todoDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: textPrimary,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              SizedBox(
                width: 140,
                child: Text(
                  'Todo Done',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: Text(
                  'keep it up',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: textPrimary,
                    fontSize: 10,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: myOrange,
            ),
            child: Text(
              todoDone,
              style: const TextStyle(
                fontSize: 28,
                color: bgPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
