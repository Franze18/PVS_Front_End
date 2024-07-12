import 'package:flutter/material.dart';

import '../Service/User.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey <FormState>();
  String firstname = '';
  String middlename = '';
  String lastname ='';
  String address ='';
  String phonenumber ='';


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

            children: [
              SizedBox(height: 40.0),
              Text(
                'Create an Account',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    label: Text(
                      'First Name',
                      style:TextStyle(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
                validator: (value){
                  if(value == null|| value.isEmpty){
                    return 'Provide your Firstname';
                  }
                  return null;
                },
                onSaved: (value){
                  firstname = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    'Middle Name',
                    style:TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value){
                  if(value == null|| value.isEmpty){
                    return 'Provide your Lastname';
                  }
                  return null;
                },
                onSaved: (value){
                  middlename = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    'Last Name',
                    style:TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value){
                  if(value == null|| value.isEmpty){
                    return 'Provide your Lastname';
                  }
                  return null;
                },
                onSaved: (value){
                  lastname = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    'Address',
                    style:TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Provide an Address';
                  }
                  return null;
                },
                onSaved: (value){
                  address = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    'Phone Number',
                    style:TextStyle(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                validator: (value){
                  if(value == null|| value.isEmpty){
                    return 'Provide your Firstname';
                  }
                  if(value.length <10){
                    return '11 characters long';
                  }
                  return null;
                },
                onSaved: (value){
                  phonenumber = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {Navigator.pushReplacementNamed(context, '/signtwo');},
                child: Text('Next', style: TextStyle(color: Colors.white), ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
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
        SizedBox(height: 25.0,),
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