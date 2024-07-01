// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app_lesson10_l2/widgets/counterText.dart';
import 'package:to_do_app_lesson10_l2/widgets/toDoCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _ToDoAppState extends State<ToDoApp> {
  List allTasks = [
    Task(title: "Task Defulte", status: false),
    Task(title: "Task", status: false),
  ];

  final myController = TextEditingController();
  String myText = "";

  deletTask(int delIndex) {
    setState(() {
      allTasks.remove(allTasks[delIndex]);
    });
  }

  deleteAll() {
    setState(() {
      allTasks.clear();
    });
  }

  myfunc(String tit, bool sta) {
    setState(() {
      if (myController.text != "") {
        var myAdd = Task(title: tit, status: sta);
        allTasks.add(myAdd);
        myController.text = "";
        Navigator.pop(context);
      }
    });
  }

  calculatedCompletedTask() {
    int completedTask = 0;
    allTasks.forEach((item) {
      if (item.status) {
        completedTask++;
      }
    });
    return completedTask;
  }

  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
      // allTasks[0].status ? allTasks[0].status = false : allTasks[0].status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  color: Color.fromRGBO(58, 66, 86, 0.7),
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // color: Colors.blueAccent,
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            controller: myController,
                            keyboardType: TextInputType.name,
                            maxLength: 20,
                            cursorRadius: Radius.circular(50),
                            decoration: InputDecoration(
                              fillColor: Colors.blueAccent,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 33,
                                color: Colors.white,
                              ),
                              hintText: "Add New Task",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100,
                            ),
                            TextButton(
                              onPressed: () {
                                myText = myController.text;
                                myfunc(myText, false);
                              },
                              child: Text(
                                "ADD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Exit"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        
        },
        child: Icon(
          Icons.add,
          size: 33,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(
                Icons.delete_forever,
                size: 37,
                color: const Color.fromARGB(255, 243, 110, 100),
              )),
        ],
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
        centerTitle: true,
        title: Text(
          "TO DO APP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontSize: 33,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CounterText(
                allToDos: allTasks.length,
                allCompleted: calculatedCompletedTask(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(209, 224, 224, 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 550,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: allTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoCard(
                        varTitle: allTasks[index].title,
                        doneOrNot: allTasks[index].status,
                        changeStatus: changeStatus,
                        index: index,
                        delete: deletTask,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
