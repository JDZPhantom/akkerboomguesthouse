
import 'package:akkerboomguesthouseapp/home_page.dart';
import 'package:akkerboomguesthouseapp/reports_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:akkerboomguesthouseapp/reports_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //controllers
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password:_passwordController.text.trim() );  }

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
                      height:50
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0 ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration:InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: "Email"
                      ),
                      validator: (value){
                        if(value!=null && value.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.toString())){
                          //allow upper and lower case alphabets and space
                          return "Invalid Email";
                        }else{
                          return null;
                        }
                      },
                    ),

                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0 ),

                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          hintText: "Password"
                      ),
                      validator: (value) {
                        if (value!=null && value.isEmpty )
                          return "Please enter password";
                        return null;
                      },
                    ),

                  ),

                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0 ),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration:BoxDecoration(
                              color: Colors.limeAccent[200],
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child:Center(child:
                          Text("Sign In",
                            style:TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ) ,),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height:25),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        // Text("Here are the reports",
                        //   style:TextStyle(color:Colors.black,
                        //     fontWeight: FontWeight.bold,),),


                        // RichText(
                        //   text: TextSpan(
                        //     style: TextStyle(fontSize: 15, color: Colors.blue),
                        //     children: <TextSpan>[
                        //       TextSpan(
                        //           text: 'Click Here ',
                        //           recognizer: TapGestureRecognizer()
                        //             ..onTap = () {
                        //               Navigator.push(context,
                        //                 MaterialPageRoute(builder: (context)=> reports_page()),
                        //               );
                        //             },
                        //           style: TextStyle(
                        //             color: Colors.blue,
                        //           )),
                        //
                        //     ],
                        //   ),
                        // )
                      ]),

                ],),
            ),
          ),
        )
    );
  }
}
