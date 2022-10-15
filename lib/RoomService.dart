import 'dart:developer';

import 'package:akkerboomguesthouseapp/Booking_page.dart';
import 'package:akkerboomguesthouseapp/RoomService.dart';
import 'package:akkerboomguesthouseapp/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emoji_feedback/emoji_feedback.dart';
import 'package:akkerboomguesthouseapp/LaundryAndCleaning.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:akkerboomguesthouseapp/customer _review_page.dart';
import 'package:akkerboomguesthouseapp/OrderFood.dart';

class RoomService extends StatefulWidget {
  const RoomService({Key? key}) : super(key: key);

  @override
  State<RoomService> createState() => _RoomServiceState();
}

class _RoomServiceState extends State<RoomService> {

  Widget _selectedPlan(Color color, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      padding: EdgeInsets.only(left: 20),
      height: 120,
      width: 240,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: GoogleFonts.bebasNeue(fontSize: 30)),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: GoogleFonts.bebasNeue(fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget _mainMenu(
      String image,
      String name,

      ) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              height: 60,
              decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: GoogleFonts.bebasNeue(fontSize: 20),
            )
          ],
        ),
      ),
      onTap: (){
        if(name=="Order Food"){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>OrderFood()),
          );
        }




      },
    );
  }

  get index => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lime,
        title: Text(
          "Room Service:",
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: ListView(
            padding: EdgeInsets.only(left: 30, top: 30),
            children: [


              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select: ',
                      style: GoogleFonts.bebasNeue(fontSize: 30),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                      child: Container(
                        height: 300,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.30,
                          children: [
                            _mainMenu('assets/Akkerboom.png', 'Order Food'),
                            _mainMenu('assets/Akkerboom.png', 'Nearby Activites'),
                            _mainMenu('assets/Akkerboom.png', 'Maintainence '),
                            _mainMenu('assets/Akkerboom.png', 'Contact'),


                          ],
                        ),
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