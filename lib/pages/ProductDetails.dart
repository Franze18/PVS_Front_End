import 'package:flutter/material.dart';
import 'package:pvsfronend/Service/Product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                product.url,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                product.productName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '₱${product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  product.description,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/transaction_details',
                    arguments: product,
                  );
                },
                child: Text('Buy Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
