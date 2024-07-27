import 'package:flutter/material.dart';
import 'package:pvsfronend/Service/Product.dart';
import 'package:pvsfronend/Service/transaction.dart';
import 'package:pvsfronend/config.dart';

class TransactionDetails extends StatefulWidget {
  final Product product;

  const TransactionDetails({required this.product, Key? key}) : super(key: key);

  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  Future<void> submitTransaction() async {
    try {
      final address = addressController.text;
      final userId = 1;

      final transaction = Transaction(
        id: 0,
        productId: widget.product.id,
        userId: userId,
        orderedDate: DateTime.now(),
        status: 'Pending',
        address: address,
      );

      await TransactionService(baseUrl: '${Config.baseUrl}').addTransaction(transaction);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction completed successfully!')),
      );
      Navigator.popUntil(context, ModalRoute.withName('/dashboard'));
    } catch (e) {
      print('Error submitting transaction: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to complete transaction: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '₱${widget.product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: submitTransaction,
                child: Text('Submit Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
