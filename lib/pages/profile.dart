import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'ALICE GOU';
  String address = 'BANBAN TARLAC';
  String phoneNumber = '09123456789';
  String email = 'lumakisafarm@gmail.com';

  void _editName() {
    _editField('Edit Name', 'Name', name, (value) {
      setState(() {
        name = value;
      });
    });
  }

  void _editAddress() {
    _editField('Edit Address', 'Address', address, (value) {
      setState(() {
        address = value;
      });
    });
  }

  void _editPhoneNumber() {
    _editField('Edit Phone Number', 'Phone Number', phoneNumber, (value) {
      setState(() {
        phoneNumber = value;
      });
    });
  }

  void _editEmail() {
    _editField('Edit Email', 'Email', email, (value) {
      setState(() {
        email = value;
      });
    });
  }

  void _editField(String title, String labelText, String initialValue, ValueChanged<String> onSave) {
    final TextEditingController _controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(_controller.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
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
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
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
            SizedBox(height: 40.0),
            _buildProfileField(Icons.person_2, 'Name', name, _editName),
            SizedBox(height: 40.0),
            _buildProfileField(Icons.location_on_outlined, 'Address', address, _editAddress),
            SizedBox(height: 40.0),
            _buildProfileField(Icons.phone_android, 'Phone Number', phoneNumber, _editPhoneNumber),
            SizedBox(height: 40.0),
            _buildProfileField(Icons.email_sharp, 'Email', email, _editEmail),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(IconData icon, String label, String value, VoidCallback onEdit) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        SizedBox(width: 15.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Colors.black),
          onPressed: onEdit,
        ),
      ],
    );
  }
}
