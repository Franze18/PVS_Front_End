import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl;

  ProductService(this.baseUrl);

  Future<List<Product>> fetchProducts(String category) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

class Product {
  int id;
  String productName;
  String description;
  double price;
  String url;

  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.price,
    required this.url});

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
      'id': int id,
      'productName': String productName,
      'description': String description,
      'price': double price,
      'url': String url
      } => Product(
          id: id,
          productName: productName,
          description: description,
          price: price,
          url: url
      ),
      _ => throw const FormatException('Failed to load products'),
    };
  }
}