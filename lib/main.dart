import 'package:flutter/material.dart';
import 'package:pvsfronend/pages/Login.dart';
import 'package:pvsfronend/pages/Signup.dart';
import 'package:pvsfronend/pages/Admindashboard.dart';
import 'package:pvsfronend/pages/Signtwo.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/signup',
  routes:{
    '/signup':(context)=>Signup(),
    '/login' : (context) =>Login(),
    '/dashboard' : (context) =>Admindashboard(),
    '/signtwo' : (context) => Signtwo(),



  },
));