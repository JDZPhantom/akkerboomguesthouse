import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emoji_feedback/emoji_feedback.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  get index => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rate your visit")),
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
              child: EmojiFeedback(onChange: (index){print(index);}),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MaterialButton(onPressed: (){
                 FirebaseAuth.instance.signOut();
              }
                 ,color: Colors.limeAccent,
                child: Text("sign out"),
               ),
            ),
          ],
        ),
      ),
    );
  }
}
