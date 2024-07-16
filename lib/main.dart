import 'package:flutter/material.dart';
import 'package:pvsfronend/pages/Cart.dart';
import 'package:pvsfronend/pages/Favorite.dart';
import 'package:pvsfronend/pages/Login.dart';
import 'package:pvsfronend/pages/Signup.dart';
import 'package:pvsfronend/pages/Dashboard.dart';
import 'package:pvsfronend/pages/Signtwo.dart';
import 'package:pvsfronend/pages/profile.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/cart',
  routes:{
    '/signup':(context)=>Signup(),
    '/login' : (context) =>Login(),
    '/dashboard' : (context) =>Dashboard(),
    '/signtwo' : (context) => Signtwo(),
    '/cart' : (context) => MyHomePage(),
    '/favorite' : (context) => Favorite(),
    '/profile' : (context) => Profile(),


  },
));