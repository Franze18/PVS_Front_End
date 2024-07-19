import 'package:flutter/material.dart';

// Model class to represent a transaction
class Transaction {
  final String productName;
  final int quantity;
  final double price;
  final DateTime date;
  final String status;

  Transaction({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.date,
    required this.status,
  });
}

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  // Sample list of transactions (replace with your actual data)
  List<Transaction> transactions = [
    Transaction(
      productName: 'Product A',
      quantity: 2,
      price: 25.0,
      date: DateTime.now().subtract(Duration(days: 2)),
      status: 'Completed',
    ),
    Transaction(
      productName: 'Product B',
      quantity: 1,
      price: 50.0,
      date: DateTime.now().subtract(Duration(days: 1)),
      status: 'Pending',
    ),
    Transaction(
      productName: 'Product C',
      quantity: 3,
      price: 15.0,
      date: DateTime.now(),
      status: 'Completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].productName,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quantity: ${transactions[index].quantity.toString()}'),
                        Text('Price: \$${transactions[index].price.toStringAsFixed(2)}'),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text('Date: ${transactions[index].date.toString()}'),
                    Text('Status: ${transactions[index].status}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

