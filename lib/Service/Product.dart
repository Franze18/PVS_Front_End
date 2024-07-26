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