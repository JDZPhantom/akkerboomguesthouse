import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:akkerboomguesthouseapp/main_page.dart';
import 'package:akkerboomguesthouseapp/home_page.dart';
import 'package:akkerboomguesthouseapp/Welcomescreen.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcomescreen(),
    );
  }
}