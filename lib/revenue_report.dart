import 'package:akkerboomguesthouseapp/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Revenue_report extends StatefulWidget {
  Revenue_report({Key ?key}) : super(key: key);

  @override
  _Revenue_reportState createState() => _Revenue_reportState();
}

class _Revenue_reportState extends State<Revenue_report> {




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(image:  DecorationImage(
        image: AssetImage("assets/revenueReport.png"),
        fit: BoxFit.fitWidth,
        // colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.2),BlendMode.dstATop)
      )
      ),);
  }}
