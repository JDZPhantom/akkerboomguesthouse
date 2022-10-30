
import 'package:akkerboomguesthouseapp/home_page.dart';
import 'package:akkerboomguesthouseapp/reports_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:akkerboomguesthouseapp/reports_page.dart';

import 'main_page.dart';


class welcomescreen extends StatefulWidget {
  const welcomescreen({Key? key}) : super(key: key);

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {

  //controllers
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  // Future signIn() async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password:_passwordController.text.trim() );  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[



                  ClipOval(
                    child: Image.asset(
                      "assets/Akkerboom.png",

                      width: 300, // x2 (twice) the radius of CircleAvatar
                      height: 300, // x2 (twice) the radius of CircleAvatar
                    ),

                  ),

                  Text('Hello There!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 54,
                    ),
                  ),
                  SizedBox(
                      height:10
                  ),
                  Text("Welcome to Akkerboom Guest House",
                      style: TextStyle(

                        fontSize: 20,

                      )),
                  SizedBox(
                      height:10
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0 ),
                    child: ElevatedButton(

                        onPressed:(){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()),);
                        },
                        child: const Text("Place a booking now"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          minimumSize: const Size.fromHeight(
                              40), // fromHeight use double.infinity as width and 40 is the height
                        ))
                    
                  ),



                  SizedBox(height:25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Owner?",
                          style:TextStyle(color:Colors.black,
                            fontWeight: FontWeight.bold,),),


                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Click Here ',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>MainPage()),
                                      );
                                    },
                                  style: TextStyle(
                                    color: Colors.blue,
                                  )),

                            ],
                          ),
                        )
                      ]),

                ],),
            ),
          ),
        )
    );
  }
}
