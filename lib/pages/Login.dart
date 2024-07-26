import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  bool isLoading = false;

  Future<bool> login(LoginRequest loginRequest) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.192.205:8080/api/v1/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginRequest.toJson()),
      );

      if (response.statusCode == 200) {
        print('Login successful');
        return true;
      } else {
        print('Failed to login: ${response.statusCode}');
        print('Response: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error during login: $error');
      return false;
    }
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
      _obscureIcon = _obscure ? Icons.visibility_off : Icons.visibility;
    });
  }

  void _submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });

      LoginRequest loginRequest = LoginRequest(email: email, password: password);
      bool isLoggedIn = await login(loginRequest);

      setState(() {
        isLoading = false;
      });

      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login to your account',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Enter your email to login for this website',
              style: TextStyle(fontSize: 11.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Form(
              key: formKey,
              child: Column(
                children: [
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
                        onPressed: _toggleObscure,
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
                        return 'Password must be 20 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submit,
                    child: isLoading
                        ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Don't have an account?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signup');
              },
              child: Text(
                'Create new account',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'usernameOrEmail': email,
    'password': password,
  };
}
