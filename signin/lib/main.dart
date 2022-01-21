import 'package:flutter/material.dart';
import 'package:signin/login.dart';
import 'package:signin/register.dart';
 import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login':(context)=>MyLogin(),
      'register':(context)=>MyRegister()
    },
  ));
}


