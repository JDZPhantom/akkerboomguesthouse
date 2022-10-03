import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:akkerboomguesthouseapp/task.dart';
import 'package:akkerboomguesthouseapp/new_task_form.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Booking_page extends StatefulWidget {
  const Booking_page({Key? key}) : super(key: key);



  @override
  State<Booking_page> createState() => _Booking_pageState();
}


class _Booking_pageState extends State<Booking_page> {
  late String name,date,specreq;

  void _createBooking(String numberofguests,String Checkindate,String CheckOutdate , String guestname ,String specialRequests) {


      FirebaseFirestore.instance
          .collection('bookings')
          .add({'CheckOutdate': CheckOutdate});
      FirebaseFirestore.instance
          .collection('bookings')
          .add({'numberofguests': numberofguests});
      FirebaseFirestore.instance
          .collection('bookings')
          .add({'Checkindate': Checkindate});
      FirebaseFirestore.instance
          .collection('bookings')
          .add({'guestname':  guestname});
      FirebaseFirestore.instance
          .collection('bookings')
          .add({'specialRequests': specialRequests});

  }
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
              image: AssetImage(""),
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
