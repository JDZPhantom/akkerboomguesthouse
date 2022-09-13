import 'package:akkerboomguesthouseapp/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Room_service_report extends StatefulWidget {
  Room_service_report({Key ?key}) : super(key: key);

  @override
  _Room_service_reportState createState() => _Room_service_reportState();
}

class _Room_service_reportState extends State<Room_service_report> {





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(image:  DecorationImage(
        image: AssetImage("assets/Room_Service.png"),
        fit: BoxFit.fitWidth,
        // colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.2),BlendMode.dstATop)
      )
      ),);
  }}