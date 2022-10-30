import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:akkerboomguesthouseapp/login_page.dart';
import 'package:akkerboomguesthouseapp/home_page.dart';
import 'package:akkerboomguesthouseapp/reports_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
          builder:(context,snapshot) {
            if(snapshot.hasData){
              return reports_page();
            }else{
              return LoginPage();
            }
          }),
    );
  }
}