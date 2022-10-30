import 'package:emoji_feedback/emoji_feedback.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Customer_Review extends StatefulWidget {
  const Customer_Review({Key? key}) : super(key: key);

  @override
  State<Customer_Review> createState() => _Customer_ReviewState();
}

class _Customer_ReviewState extends State<Customer_Review> {
  final fb = FirebaseDatabase.instance;
  final myController = TextEditingController();
  final feedback = "feedback";
  late String title;
  String text = "No Value Entered";
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Leave a review'),
          content:  SingleChildScrollView(
            child:  ListBody(
              children: [
                Text('Thank you for your feedback!'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _submitText() {
    setState(() {
      text = title;
      FirebaseFirestore.instance
          .collection('customerReviews')
          .add({'Review': text});
    });
    text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lime,
        title: Text(
          "Leave a Review",
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "How did you like your stay?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EmojiFeedback(onChange: (index) {
                print(index);
              }),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(labelText: "Any Feedback?"),
                      onChanged: (value) => title = value,

                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        myController.clear();
                        _submitText();
                        _showcontent();
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(8),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: const Text('Submit')),

                ],
              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}
