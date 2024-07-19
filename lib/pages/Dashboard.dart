import 'package:flutter/material.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = 'Regular'; // Default selected category
  Map<String, List<Map<String, dynamic>>> categoryProducts = {
    'Regular': [
      {
        'url': 'https://t3.ftcdn.net/jpg/05/01/82/34/360_F_501823412_29LHygIVQhPfJgOnEpa6v9BOFsMZWwZ8.jpg',
        'description': 'Classic Regular Fit T-Shirt',
        'price': '900.00',
      },
      {
        'url': 'https://static.vecteezy.com/system/resources/previews/011/477/281/non_2x/black-red-shirt-sport-jersey-design-vector.jpg',
        'description': 'Sporty Black and Red Jersey',
        'price': '900.00',
      },
      {
        'url': 'https://static.vecteezy.com/system/resources/previews/017/352/537/non_2x/red-black-t-shirt-sport-jersey-design-vector.jpg',
        'description': 'Red and Black Sport T-Shirt',
        'price': '900.00',
      },
      {
        'url': 'https://static.vecteezy.com/ti/vetor-gratis/t1/9157952-design-de-camiseta-preta-esporte-vetor.jpg',
        'description': 'Black Sport T-Shirt Design',
        'price': '900.00',
      },
      {
        'url': 'https://t4.ftcdn.net/jpg/05/45/38/33/360_F_545383377_GfFmO4yWXzIMjU62URs85Zl3Ufc7BAJJ.jpg',
        'description': 'Casual T-Shirt with Print',
        'price': '900.00',
      },
    ],
    'NBA Cut': [
      {
        'url': 'https://img.lazcdn.com/g/p/eda418154d78fc6ea7c44cd6840c3570.jpg_720x720q80.jpg',
        'description': 'NBA Jersey - Home Edition',
        'price': '800.00',
      },
      {
        'url': 'https://my-test-11.slatic.net/p/a7cb9e7c492153bb6bdb451d37503059.jpg',
        'description': 'Authentic NBA Cut Jersey',
        'price': '800.00',
      },
      {
        'url': 'https://th-live-02.slatic.net/p/d50d6bc4a59bfb36c3a41990b9ace7f0.jpg',
        'description': 'Stylish NBA Jersey',
        'price': '800.00',
      },
      {
        'url': 'https://lzd-img-global.slatic.net/g/p/b4566f76343638d5b07403c713414611.jpg_720x720q80.jpg_.webp',
        'description': 'NBA Cut Jersey - Special Edition',
        'price': '800.00',
      },
      {
        'url': 'https://cdn.shopify.com/s/files/1/0650/7764/1434/products/1621410151660.jpg?v=1662845584',
        'description': 'Limited Edition NBA Jersey',
        'price': '800.00',
      },
    ],
    'T-Shirt': [
      {
        'url': 'https://img.lazcdn.com/g/p/3e8afd87170d8f846854e96c420a8709.jpg_720x720q80.jpg',
        'description': 'Cotton T-Shirt - Black Red',
        'price': '250.00',
      },
      {
        'url': 'https://img.lazcdn.com/g/p/a8259f0c4913356e9135a641d7a6c423.jpg_720x720q80.jpg',
        'description': 'Graphic Print T-Shirt',
        'price': '250.00',
      },
      {
        'url': 'https://ph-test-11.slatic.net/p/b71969998880f18a3271e59236ffa0ef.jpg',
        'description': 'Comfort Fit T-Shirt',
        'price': '250.00',
      },
      {
        'url': 'https://ph-test-11.slatic.net/p/aa6d8076d71bbf072564291b226e99e3.jpg',
        'description': 'Casual Wear T-Shirt',
        'price': '250.00',
      },
      {
        'url': 'https://ph-test-11.slatic.net/p/6d88c66ccf6d1ed3ca1457221ec2c722.jpg',
        'description': 'Basic Tee - Black',
        'price': '250.00',
      },
    ],
    'Warmer': [
      {
        'url': 'https://www.crushpixel.com/big-static15/preview4/long-sleeve-tshirt-sport-jersey-2020648.jpg',
        'description': 'Long Sleeve Sport Jersey',
        'price': '600.00',
      },
      {
        'url': 'https://www.crushpixel.com/big-static15/preview4/long-sleeve-tshirt-sport-motorcycle-2020488.jpg',
        'description': 'Sporty Long Sleeve for Motorcycle',
        'price': '600.00',
      },
      {
        'url': 'https://media.karousell.com/media/photos/products/2023/9/8/custom_long_sleeve_sublimation_1694145314_99a12f3e_progressive.jpg',
        'description': 'Custom Long Sleeve Sublimation',
        'price': '600.00',
      },
      {
        'url': 'https://image.freepik.com/free-vector/long-sleeve-t-shirt-sport-motorcycle-jersey_135979-492.jpg',
        'description': 'Sport Long Sleeve Jersey',
        'price': '600.00',
      },
      {
        'url': 'https://www.crushpixel.com/big-static15/preview4/long-sleeve-tshirt-sport-motorcycle-2021705.jpg',
        'description': 'Motorcycle Sport Long Sleeve',
        'price': '600.00',
      },
    ],
    'Polo Regular': [
      {
        'url': 'https://myfihu.com/cdn/shop/products/I11D01291123_05_PLW_300x300.jpg?v=1701398732',
        'description': 'Regular Polo Shirt - White',
        'price': '500.00',
      },
      {
        'url': 'https://myfihu.com/cdn/shop/products/I10D03160124_15_PL_300x300.jpg?v=1705393350',
        'description': 'Polo Shirt - Light Blue',
        'price': '500.00',
      },
      {
        'url': 'https://myfihu.com/cdn/shop/files/I11D03290324_16_PL_300x300.jpg?v=1711707972',
        'description': 'Classic Polo Shirt - Grey',
        'price': '500.00',
      },
      {
        'url': 'https://myfihu.com/cdn/shop/products/I11D10070324_10_PL_Blue_300x300.jpg?v=1709807568',
        'description': 'Polo Shirt - Blue',
        'price': '500.00',
      },
      {
        'url': 'https://myfihu.com/cdn/shop/products/I11D01261023_36_PL_300x300.jpg?v=1698831698',
        'description': 'Polo Shirt - Black',
        'price': '500.00',
      },
    ],
    'Chinese Collar': [
      {
        'url': 'https://thumbs.dreamstime.com/b/sports-polo-collar-t-shirt-jersey-design-flat-sketch-illustration-abstract-pattern-cricket-concept-front-back-view-243254622.jpg',
        'description': 'Sports Polo with Chinese Collar',
        'price': '450.00',
      },
      {
        'url': 'https://www.crushpixel.com/big-static15/preview4/jersey-tshirt-polo-collar-2020620.jpg',
        'description': 'T-Shirt with Polo Collar',
        'price': '450.00',
      },
      {
        'url': 'https://thumbs.dreamstime.com/b/women-sports-polo-collar-t-shirt-jersey-design-concept-illustration-vector-template-suitable-girls-ladies-soccer-cricket-215455239.jpg',
        'description': 'Sporty T-Shirt with Collar',
        'price': '450.00',
      },
      {
        'url': 'https://thumbs.dreamstime.com/b/sports-polo-collar-t-shirt-jersey-design-vector-template-cricket-concept-front-back-view-soccer-football-tennis-217613846.jpg',
        'description': 'Sport Jersey Design T-Shirt',
        'price': '450.00',
      },
      {
        'url': 'https://thumbs.dreamstime.com/z/sports-polo-collar-t-shirt-jersey-design-vector-template-kaizer-chiefs-concept-front-back-view-soccer-cricket-208914824.jpg',
        'description': 'Sport Jersey T-Shirt Design',
        'price': '450.00',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
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
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/cart');
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryProducts.keys.map((category) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: selectedCategory == category,
                          onSelected: (isSelected) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryProducts[selectedCategory]!.length,
                itemBuilder: (context, index) {
                  final product = categoryProducts[selectedCategory]![index];
                  return ListTile(
                    leading: Image.network(
                      product['url'],
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product['description']),
                    subtitle: Text(product['price']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int numberOfOrder = 1;
  int selectedSizeIndex = -1;
  List<int> selectedChipIndices = [];
  late double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['description']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.product['url'],
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              widget.product['price'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Details:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Description: ${widget.product['description']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'CATEGORY',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text('CUSTOM SURNAME&NO.'),
                  selected: selectedChipIndices.contains(0),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedChipIndices.add(0);
                      } else {
                        selectedChipIndices.remove(0);
                      }
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                FilterChip(
                  label: Text('CUSTOM TEAM NAME'),
                  selected: selectedChipIndices.contains(1),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedChipIndices.add(1);
                      } else {
                        selectedChipIndices.remove(1);
                      }
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                FilterChip(
                  label: Text('SHORT'),
                  selected: selectedChipIndices.contains(2),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedChipIndices.add(2);
                      } else {
                        selectedChipIndices.remove(2);
                      }
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
              ],
            ),


            SizedBox(height: 16),
            Text(
              'SIZE',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: Text('XS'),
                  selected: selectedSizeIndex == 0,
                  onSelected: (selected) {
                    setState(() {
                      selectedSizeIndex = selected ? 0 : -1;
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),

                ChoiceChip(
                  label: Text('S'),
                  selected: selectedSizeIndex == 1,
                  onSelected: (selected) {
                    setState(() {
                      selectedSizeIndex = selected ? 1 : -1;
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                ChoiceChip(
                  label: Text('M'),
                  selected: selectedSizeIndex == 2,
                  onSelected: (selected) {
                    setState(() {
                      selectedSizeIndex = selected ? 2 : -1;
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                ChoiceChip(
                  label: Text('L'),
                  selected: selectedSizeIndex == 3,
                  onSelected: (selected) {
                    setState(() {
                      selectedSizeIndex = selected ? 3 : -1;
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                ChoiceChip(
                  label: Text('XL'),
                  selected: selectedSizeIndex == 4,
                  onSelected: (selected) {
                    setState(() {
                      selectedSizeIndex = selected ? 4 : -1;
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                ChoiceChip(
                  label: Text('2XL'),
                  selected: selectedSizeIndex == 5,
                  onSelected: (selected) {
                    setState(() {
                      selectedSizeIndex = selected ? 5 : -1;
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                ChoiceChip(
                  label: Text('3XL'),
                  selected: selectedSizeIndex == 6,
                  onSelected: (selected) {
                    setState(() {
                      selectedSizeIndex = selected ? 6 : -1;
                    });
                  },
                  selectedColor: Colors.grey[400],
                ),
                // Continue adding ChoiceChip widgets for each size
                // Remember to adjust the index in selectedSizeIndex accordingly
              ],
            ),

            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          numberOfOrder -= 1;
                        });
                      },
                    ),
                    Text(
                      numberOfOrder.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          numberOfOrder += 1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
