import 'package:flutter/material.dart';
import 'package:pvsfronend/Service/Product.dart';
import 'package:pvsfronend/pages/Cart.dart';
import 'package:pvsfronend/pages/Login.dart';
import 'package:pvsfronend/pages/Signup.dart';
import 'package:pvsfronend/pages/Dashboard.dart';
import 'package:pvsfronend/pages/TransactionDetails.dart';
import 'package:pvsfronend/pages/TransactionHistory.dart';
import 'package:pvsfronend/pages/profile.dart';
import 'package:pvsfronend/pages/Orderdetails.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/signup',
  routes: {
    '/signup': (context) => Signup(),
    '/login': (context) => Login(),
    '/dashboard': (context) => Dashboard(),
    '/cart': (context) => Cart(),
    '/transaction_details': (context) {
      // Retrieve the product from the route arguments
      final Product product = ModalRoute.of(context)!.settings.arguments as Product;
      return TransactionDetails(product: product);
    },
    '/transaction_history': (context) => TransactionHistory()
  },
));
