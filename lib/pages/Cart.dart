import 'package:flutter/material.dart';

void main() {
  runApp(Cart());
}


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> cart = []; // Empty list, no products

  double calculateTotalSales() {
    return cart.fold(0, (previousValue, element) => previousValue + element.price);
  }

  void checkout() {
    // Implement your checkout logic here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Checkout'),
        content: Text('Total Sales: \$${calculateTotalSales().toStringAsFixed(2)}'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

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
            Text(
              'PV Sportswear',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color:Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
        ],
      ),
      drawer: Drawer(
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
      ),
      body: Container(), // No content needed in the body
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total Sales: \₱${calculateTotalSales().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0),
              ),
              ElevatedButton(
                onPressed: () {
                  checkout();
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}


