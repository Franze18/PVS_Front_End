import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pvsfronend/config.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  createAccount(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('${Config.baseUrl}/api/v1/auth/register/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Navigate to login screen on successful signup
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      // Handle errors (e.g., user already exists)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create account: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/pvlogo.jpg',
              height: 50.0,
              width: 50.0,
            ),
            SizedBox(width: 10.0),
            Text(
              'PV Sportswear',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create an Account',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  label: Text(
                    'Username',
                    style: TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a username';
                  }
                  return null;
                },
                onSaved: (value) {
                  username = value!;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    'Email',
                    style: TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide an email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: _obscure,
                decoration: InputDecoration(
                  label: Text(
                    'Password',
                    style: TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.lock_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureIcon),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                        _obscureIcon = _obscure ? Icons.visibility_off : Icons.visibility;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a password';
                  }
                  if (value.length < 8) {
                    return 'Password should be at least 8 characters long';
                  }
                  if (value.length > 20) {
                    return 'Password must be at most 20 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    createAccount(username, email, password);
                  }
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Already have an account?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'Proceed to Login',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
