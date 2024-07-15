import 'package:flutter/material.dart';

void main() {
  runApp(Dashboard());
}
class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.grid_view, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
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
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {Navigator.pushReplacementNamed(context, '/cart');},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Alice Guo", style: TextStyle(color: Colors.black),),
              accountEmail: Text("aliceguo@gmail.com", style: TextStyle(color: Colors.black)),
              currentAccountPicture: CircleAvatar(radius: 300.0,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
            ElevatedButton.icon(
              onPressed: () {Navigator.pushReplacementNamed(context, '/favorite');},
              icon: Icon(Icons.favorite, color: Colors.red,),
              label: Text('Favorite', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
            ),
            SizedBox( height: 10.0 ),
            ElevatedButton.icon(
              onPressed: () {Navigator.pushReplacementNamed(context, '/profile');},
              icon: Icon(Icons.person, color: Colors.black,),
              label: Text('Profile', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton.icon(
              onPressed: () {Navigator.pushReplacementNamed(context, '/login');},
              icon: Icon(Icons.logout, color: Colors.black,),
              label: Text('Logout', style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
            ),
          ],
        ),
      ),
      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search in here...',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_list),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8,
            ),
          ),
        ),
      ),
      ),
      ],
    ),
    );
  }
}