import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title:Text(
          'User Profile',
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to previous screen
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.png'),
                    radius: 70.0,
                  ),
                ),
                Divider(
                  height: 30.0,
                  color: Colors.black,
                  thickness: 3.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_2,
                      color: Colors.black,
                    ),
                    SizedBox(width:3.0,),
                    Text(
                      'NAME',
                      style: TextStyle(
                        fontSize: 16.0,
                        color:Colors.black,
                        letterSpacing:2.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'ALICE GOU',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                      fontSize: 25.0
                  ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(width:3.0,),
                    Text(
                      'ADDRESS',
                      style: TextStyle(
                          fontSize: 16.0,
                          color:Colors.black,
                          letterSpacing:2.0
                      ),
                    ),
                  ],
                ),
                Text(
                  'BANBAN TARLAC',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                      fontSize: 25.0
                  ),
                ),
                SizedBox(height:30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                    SizedBox(width:3.0,),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          fontSize: 16.0,
                          color:Colors.black,
                          letterSpacing:2.0
                      ),
                    ),
                  ],
                ),
                Text(
                  '09123456789',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                      fontSize: 25.0
                  ),
                ),

                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Icon(
                      Icons.email_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'EMAIL',
                      style: TextStyle(
                          fontSize: 16.0,
                          color:Colors.black,
                          letterSpacing:2.0
                      ),
                    ),
                  ],
                ),
                Text(
                  'lumakisafarm@gmail.com',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                      fontSize: 25.0
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}