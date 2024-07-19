import 'package:flutter/material.dart';
import 'package:pvsfronend/pages/Cart.dart';
import 'package:pvsfronend/pages/Login.dart';
import 'package:pvsfronend/pages/Signup.dart';
import 'package:pvsfronend/pages/Dashboard.dart';
import 'package:pvsfronend/pages/TransactionHistory.dart';
import 'package:pvsfronend/pages/profile.dart';
import 'package:pvsfronend/pages/Orderdetails.dart';


void main() => runApp(MaterialApp(

  initialRoute:'/transaction',
  routes:{
    '/signup':(context)=>Signup(),
    '/login' : (context) =>Login(),
    '/dashboard' : (context) =>Dashboard(),
    '/cart' : (context) => Cart(),
    '/profile' : (context) => Profile(),
    '/order' : (context) => OrderDetailsPage(),
    '/transaction' : (context)=> TransactionHistory(),

  },
));