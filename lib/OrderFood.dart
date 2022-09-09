import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:akkerboomguesthouseapp/task.dart';
import 'package:akkerboomguesthouseapp/new_order.dart';


class OrderFood extends StatefulWidget {
  const OrderFood({Key? key}) : super(key: key);



  @override
  State<OrderFood> createState() => _OrderFoodState();
}

class _OrderFoodState extends State<OrderFood> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lime,
        title: Text(
          "Order room service",
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(""),
              fit: BoxFit.cover,
              // colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.2),BlendMode.dstATop)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new_order(),
        ),

      ),

    );
  }
}