import 'package:akkerboomguesthouseapp/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Customer_Review_report extends StatefulWidget {
  Customer_Review_report({Key ?key}) : super(key: key);

  @override
  _Customer_Review_reportState createState() => _Customer_Review_reportState();
}

class _Customer_Review_reportState extends State<Customer_Review_report> {





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(image:  DecorationImage(
        image: AssetImage("assets/Customer Ratings.png"),
        fit: BoxFit.fitWidth,
        // colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.2),BlendMode.dstATop)
      )
      ),);
  }}