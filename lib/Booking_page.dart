import 'package:flutter/material.dart';
import 'package:akkerboomguesthouseapp/task.dart';
import 'package:akkerboomguesthouseapp/new_task_form.dart';
class Booking_page extends StatefulWidget {
  const Booking_page({Key? key}) : super(key: key);

  @override
  State<Booking_page> createState() => _Booking_pageState();
}

class _Booking_pageState extends State<Booking_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
      elevation: 0.0,
      backgroundColor: Colors.lime,
      title: Text(
        "Make a Booking",
        style: TextStyle(fontSize: 20, color: Colors.black87),
      ),
      centerTitle: true,
    ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Akkerboom.png"),
              fit: BoxFit.cover,
              // colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.2),BlendMode.dstATop)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NewTaskForm(),
        ),
      ),

    );
  }
}
