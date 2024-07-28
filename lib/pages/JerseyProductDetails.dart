import 'package:flutter/material.dart';
import 'package:pvsfronend/Service/Product.dart';
import 'package:pvsfronend/Service/name_request.dart';

class JerseyProductDetails extends StatefulWidget {
  final Product product;

  const JerseyProductDetails({required this.product, Key? key}) : super(key: key);

  @override
  _JerseyProductDetailsState createState() => _JerseyProductDetailsState();
}

class _JerseyProductDetailsState extends State<JerseyProductDetails> {
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController playerNumberController = TextEditingController();
  bool hasShort = false;

  @override
  void dispose() {
    surnameController.dispose();
    teamNameController.dispose();
    playerNumberController.dispose();
    super.dispose();
  }

  Future<void> addNameRequest() async {
    NameRequest nameRequest = NameRequest(
      productId: widget.product.id,
      surname: surnameController.text,
      teamName: teamNameController.text,
      hasShort: hasShort ? 'Yes' : 'No',
      playerNumber: int.parse(playerNumberController.text),
    );

    try {
      await NameRequestService().addNameRequest(nameRequest);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name request added successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add name request')),
      );
    }
  }

  void buyNowAndNavigate() async {
    await addNameRequest();
    Navigator.pushNamed(
      context,
      '/transaction_details',
      arguments: widget.product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.product.url,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Details:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.product.description,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    labelText: 'Surname',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextField(
                  controller: teamNameController,
                  decoration: InputDecoration(
                    labelText: 'Team Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: TextField(
                  controller: playerNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Player Number',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Has Shorts:'),
                  Checkbox(
                    value: hasShort,
                    onChanged: (bool? value) {
                      setState(() {
                        hasShort = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Set the button color to black
                    foregroundColor: Colors.white, // Set the text color to white
                  ),
                  onPressed: buyNowAndNavigate,
                  child: Text('Buy Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
