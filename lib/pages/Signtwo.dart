import 'package:flutter/material.dart';

import '../Service/User.dart';

class Signtwo extends StatefulWidget {
  const Signtwo({super.key});

  @override
  State<Signtwo> createState() => _SigntwoState();
}

class _SigntwoState extends State<Signtwo> {
  final formKey = GlobalKey <FormState>();
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
              SizedBox(height: 75.0),
              Text(
                'Account Confirmation',
                style: TextStyle(fontSize: 13.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 160.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Create', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
            ]
        ),
      ),
    );
  }
}