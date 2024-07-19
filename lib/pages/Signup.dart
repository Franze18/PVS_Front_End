import 'package:flutter/material.dart';

import '../Service/User.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey <FormState>();
  String username = '';
  String email = '';
  String password ='';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;


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
            Text('PV Sportswear',
                style: TextStyle(fontWeight: FontWeight.bold,)),
          ],
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
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
                style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    'Username',
                    style:TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Provide an username';
                  }
                  return null;
                },
                onSaved: (value){
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
                    style:TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Provide an email';
                  }
                  return null;
                },
                onSaved: (value){
                  email = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: _obscure,
                decoration: InputDecoration(
                  label: Text(
                    'Password',
                    style:TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.lock_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureIcon),
                    onPressed:(){
                      setState(() {
                        _obscure = !_obscure;
                        if(_obscure){
                          _obscureIcon = Icons.visibility_off;
                        }else{
                          _obscureIcon = Icons.visibility;
                        }
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return'Provide a password';
                  }
                  if (value.length <8){
                    return'password should be atleast 8 characters long';
                  }
                  if (value.length>20){
                    return'Password must be 20 characters long';
                  }
                  return null;
                },
                onSaved: (value){
                  password = value!;
                },

              ),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {Navigator.pushReplacementNamed(context, '/');},
                child: Text('Create Account', style: TextStyle(color: Colors.white), ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 8,
                endIndent: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "or continue with",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 8,
                endIndent: 8,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    Icon(Icons.g_mobiledata),
                    SizedBox(width: 10.0,),
                    Text('Google',),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black
                ),
              ),
            ]
        ),
      ),
    );
  }
}