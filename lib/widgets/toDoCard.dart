// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  // const ToDoCard({super.key});
  final String varTitle;
  final bool doneOrNot;
  final Function changeStatus;
  final Function delete;
  final int index;

  const ToDoCard({
    super.key,
    required this.varTitle,
    required this.doneOrNot,
    required this.changeStatus,
    required this.index,
    required this.delete,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.98,
        child: Container(
          height: 70,
          margin: EdgeInsets.symmetric(
            vertical: 20,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTitle,
                style: TextStyle(
                  color: doneOrNot ? Colors.black : Colors.white,
                  decoration: doneOrNot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 25,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      // Icons.close,
                      doneOrNot ? Icons.check : Icons.close,
                      size: 44,
                      color: doneOrNot ? Colors.green : Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 35,
                        color: Color.fromARGB(255, 244, 125, 117),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
