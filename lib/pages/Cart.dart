import 'package:flutter/material.dart';
import '../Service/Product.dart'; // Ensure this path is correct

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> cart = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get the list of products from the route arguments
    final List<Product>? products = ModalRoute.of(context)?.settings.arguments as List<Product>?;
    if (products != null) {
      setState(() {
        cart = products;
      });
    }
  }

  double calculateTotalSales() {
    return cart.fold(0, (previousValue, element) => previousValue + element.price);
  }

  void checkout() {
    // Implement your checkout logic here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Checkout'),
        content: Text('Total Sales: ₱${calculateTotalSales().toStringAsFixed(2)}'),
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
            icon: Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
        ],
      ),
      body: cart.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            leading: Image.network(
              product.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.productName),
            subtitle: Text('₱${product.price.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total Sales: ₱${calculateTotalSales().toStringAsFixed(2)}',
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
