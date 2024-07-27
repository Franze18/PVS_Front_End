import 'package:flutter/material.dart';
import 'package:pvsfronend/pages/Dashboard.dart';


class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);
  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  // Customer information (can be replaced with dynamic data or retrieved from another source)
  String customerName = 'John Doe';
  String customerEmail = 'john.doe@example.com';
  String customerPhoneNumber = '+1234567890';
  String deliveryAddress = '123 Main St, City, Country';
  String message = '';

  // Payment method selection
  String selectedPaymentMethod = 'GCash';

  // Sample order data (can be replaced with dynamic data or retrieved from another source)
  List<OrderItem> orderItems = [
    OrderItem(itemName: 'Item 1', quantity: 2, price: 10.0),
    OrderItem(itemName: 'Item 2', quantity: 1, price: 5.0),
  ];
  double totalAmount = 25.0;

  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageController.text = message;
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/cart');
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
        )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildInfoTile('Name', customerName,
                trailingIcon: Icons.edit, onTap: () {
                  _editName();
                }
            ),
            _buildInfoTile('Email', customerEmail,
                trailingIcon: Icons.edit, onTap: () {
                  _editEmail();
                }
            ),
            _buildInfoTile('Phone Number', customerPhoneNumber,
                trailingIcon: Icons.edit, onTap: () {
                  _editPhoneNumber();
                }
            ),
            _buildInfoTile('Delivery Address', deliveryAddress,
                trailingIcon: Icons.edit, onTap: () {
                  _editDeliveryAddress();
                }),
            SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildPaymentMethodTile('GCash'),
            _buildPaymentMethodTile('Credit Card'),
            _buildPaymentMethodTile('Cash on Delivery'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showMessagePopup();
                  },
                  child: Text('Edit Message'),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Message:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          message.isEmpty ? 'No message' : message,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Sales: \₱${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  _placeOrder();
                },
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value,
      {IconData? trailingIcon, VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value),
      trailing: trailingIcon != null
          ? IconButton(
        icon: Icon(trailingIcon),
        onPressed: onTap,
      )
          : null,
    );
  }

  Widget _buildPaymentMethodTile(String method) {
    return RadioListTile<String>(
      title: Text(method),
      value: method,
      groupValue: selectedPaymentMethod,
      onChanged: (value) {
        setState(() {
          selectedPaymentMethod = value!;
        });
      },
    );
  }

  void _showMessagePopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Message'),
          content: TextField(
            controller: _messageController,
            onChanged: (value) {
              setState(() {
                message = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Write your message here...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  message = _messageController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _placeOrder() {
    // Implement your place order logic here
    print('Placing order...');

    // Navigate to OrderConfirmationPage after placing order
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OrderConfirmationPage(),
      ),
    );
  }

  void _editDeliveryAddress() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Delivery Address',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Delivery Address',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    deliveryAddress = value;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _editPhoneNumber() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit your Phone Number',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    customerPhoneNumber = value;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
  void _editName() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Your Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    customerName = value;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
  void _editEmail() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit your Email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    deliveryAddress = value;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class OrderItem {
  final String itemName;
  final int quantity;
  final double price;

  OrderItem({
    required this.itemName,
    required this.quantity,
    required this.price,
  });
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 150,
              color: Colors.black45,
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for your purchase!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                      (route) => false,
                );
              },
              child: Text('Back to Dashboard',
              style: TextStyle(color: Colors.black),),

            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderDetailsPage(),
  ));
}