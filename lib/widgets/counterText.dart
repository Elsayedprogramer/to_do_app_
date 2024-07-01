
import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  // const CounterText({super.key});
  int allToDos = 0;
  int allCompleted = 0;
  CounterText({super.key, required this.allToDos, required this.allCompleted});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 23),
      child: Text(
        "${allCompleted} / ${allToDos}",
        style: TextStyle(
          fontSize: 44,
          color: (allToDos == allCompleted)? Colors.green:Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
