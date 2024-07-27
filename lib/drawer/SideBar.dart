import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Alice Guo",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text("aliceguo@gmail.com",
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/transaction');
            },
            icon: Icon(
              Icons.file_download_done_sharp,
              color: Colors.black,
            ),
            label: Text(
              'History',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            label: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
