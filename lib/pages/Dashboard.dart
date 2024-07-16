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
        'price': '\$20.00',
        'isFavorite': false,
      },
      {
        'url': 'https://static.vecteezy.com/system/resources/previews/011/477/281/non_2x/black-red-shirt-sport-jersey-design-vector.jpg',
        'description': 'Sporty Black and Red Jersey',
        'price': '\$25.00',
        'isFavorite': false,
      },
      {
        'url': 'https://static.vecteezy.com/system/resources/previews/017/352/537/non_2x/red-black-t-shirt-sport-jersey-design-vector.jpg',
        'description': 'Red and Black Sport T-Shirt',
        'price': '\$22.00',
        'isFavorite': false,
      },
      {
        'url': 'https://static.vecteezy.com/ti/vetor-gratis/t1/9157952-design-de-camiseta-preta-esporte-vetor.jpg',
        'description': 'Black Sport T-Shirt Design',
        'price': '\$18.00',
        'isFavorite': false,
      },
      {
        'url': 'https://t4.ftcdn.net/jpg/05/45/38/33/360_F_545383377_GfFmO4yWXzIMjU62URs85Zl3Ufc7BAJJ.jpg',
        'description': 'Casual T-Shirt with Print',
        'price': '\$19.00',
        'isFavorite': false,
      },
    ],
    'NBA Cut': [
      {
        'url': 'https://img.lazcdn.com/g/p/eda418154d78fc6ea7c44cd6840c3570.jpg_720x720q80.jpg',
        'description': 'NBA Jersey - Home Edition',
        'price': '\$50.00',
        'isFavorite': false,
      },
      {
        'url': 'https://my-test-11.slatic.net/p/a7cb9e7c492153bb6bdb451d37503059.jpg',
        'description': 'Authentic NBA Cut Jersey',
        'price': '\$55.00',
        'isFavorite': false,
      },
      {
        'url': 'https://th-live-02.slatic.net/p/d50d6bc4a59bfb36c3a41990b9ace7f0.jpg',
        'description': 'Stylish NBA Jersey',
        'price': '\$52.00',
        'isFavorite': false,
      },
      {
        'url': 'https://lzd-img-global.slatic.net/g/p/b4566f76343638d5b07403c713414611.jpg_720x720q80.jpg_.webp',
        'description': 'NBA Cut Jersey - Special Edition',
        'price': '\$58.00',
        'isFavorite': false,
      },
      {
        'url': 'https://cdn.shopify.com/s/files/1/0650/7764/1434/products/1621410151660.jpg?v=1662845584',
        'description': 'Limited Edition NBA Jersey',
        'price': '\$60.00',
        'isFavorite': false,
      },
    ],
    'T-Shirt': [
      {
        'url': 'https://img.lazcdn.com/g/p/3e8afd87170d8f846854e96c420a8709.jpg_720x720q80.jpg',
        'description': 'Cotton T-Shirt - Black Red',
        'price': '\$15.00',
        'isFavorite': false,
      },
      {
        'url': 'https://img.lazcdn.com/g/p/a8259f0c4913356e9135a641d7a6c423.jpg_720x720q80.jpg',
        'description': 'Graphic Print T-Shirt',
        'price': '\$17.00',
        'isFavorite': false,
      },
      {
        'url': 'https://ph-test-11.slatic.net/p/b71969998880f18a3271e59236ffa0ef.jpg',
        'description': 'Comfort Fit T-Shirt',
        'price': '\$16.00',
        'isFavorite': false,
      },
      {
        'url': 'https://ph-test-11.slatic.net/p/aa6d8076d71bbf072564291b226e99e3.jpg',
        'description': 'Casual Wear T-Shirt',
        'price': '\$18.00',
        'isFavorite': false,
      },
      {
        'url': 'https://ph-test-11.slatic.net/p/6d88c66ccf6d1ed3ca1457221ec2c722.jpg',
        'description': 'Basic Tee - Black',
        'price': '\$14.00',
        'isFavorite': false,
      },
    ],
    'Warmer': [
      {
        'url': 'https://www.crushpixel.com/big-static15/preview4/long-sleeve-tshirt-sport-jersey-2020648.jpg',
        'description': 'Long Sleeve Sport Jersey',
        'price': '\$30.00',
        'isFavorite': false,
      },
      {
        'url': 'https://www.crushpixel.com/big-static15/preview4/long-sleeve-tshirt-sport-motorcycle-2020488.jpg',
        'description': 'Sporty Long Sleeve for Motorcycle',
        'price': '\$32.00',
        'isFavorite': false,
      },
      {
        'url': 'https://media.karousell.com/media/photos/products/2023/9/8/custom_long_sleeve_sublimation_1694145314_99a12f3e_progressive.jpg',
        'description': 'Custom Long Sleeve Sublimation',
        'price': '\$35.00',
        'isFavorite': false,
      },
      {
        'url': 'https://image.freepik.com/free-vector/long-sleeve-t-shirt-sport-motorcycle-jersey_135979-492.jpg',
        'description': 'Sport Long Sleeve Jersey',
        'price': '\$31.00',
        'isFavorite': false,
      },
      {
        'url': 'https://www.crushpixel.com/big-static15/preview4/long-sleeve-tshirt-sport-motorcycle-2021705.jpg',
        'description': 'Motorcycle Sport Long Sleeve',
        'price': '\$33.00',
        'isFavorite': false,
      },
    ],
    'Polo Regular': [
      {
        'url': 'https://myfihu.com/cdn/shop/products/I11D01291123_05_PLW_300x300.jpg?v=1701398732',
        'description': 'Regular Polo Shirt - White',
        'price': '\$25.00',
        'isFavorite': false,
      },
      {
        'url': 'https://myfihu.com/cdn/shop/products/I10D03160124_15_PL_300x300.jpg?v=1705393350',
        'description': 'Polo Shirt - Light Blue',
        'price': '\$27.00',
        'isFavorite': false,
      },
      {
        'url': 'https://myfihu.com/cdn/shop/files/I11D03290324_16_PL_300x300.jpg?v=1711707972',
        'description': 'Classic Polo Shirt - Grey',
        'price': '\$26.00',
        'isFavorite': false,
      },
      {
        'url': 'https://myfihu.com/cdn/shop/products/I11D10070324_10_PL_Blue_300x300.jpg?v=1709807568',
        'description': 'Polo Shirt - Blue',
        'price': '\$28.00',
        'isFavorite': false,
      },
      {
        'url': 'https://myfihu.com/cdn/shop/products/I11D01261023_36_PL_300x300.jpg?v=1698831698',
        'description': 'Polo Shirt - Black',
        'price': '\$24.00',
        'isFavorite': false,
      },
    ],
    'Chinese Collar': [
      {
        'url': 'https://thumbs.dreamstime.com/b/sports-polo-collar-t-shirt-jersey-design-flat-sketch-illustration-abstract-pattern-cricket-concept-front-back-view-243254622.jpg',
        'description': 'Sports Polo with Chinese Collar',
        'price': '\$30.00',
        'isFavorite': false,
      },
      {
        'url': 'https://thumbs.dreamstime.com/b/sports-jersey-t-shirt-design-concept-vector-template-football-front-back-view-soccer-cricket-volleyball-rugby-tennis-212826877.jpg',
        'description': 'Chinese Collar Sports Jersey',
        'price': '\$32.00',
        'isFavorite': false,
      },
      {
        'url': 'https://thumbs.dreamstime.com/b/sports-jersey-t-shirt-design-concept-vector-template-football-front-back-view-soccer-cricket-volleyball-rugby-tennis-213178310.jpg',
        'description': 'Cricket Chinese Collar Jersey',
        'price': '\$33.00',
        'isFavorite': false,
      },
      {
        'url': 'https://thumbs.dreamstime.com/b/sports-polo-collar-t-shirt-jersey-design-vector-template-cricket-concept-front-back-view-soccer-football-tennis-216539947.jpg',
        'description': 'Polo Collar T-Shirt Design',
        'price': '\$31.00',
        'isFavorite': false,
      },
      {
        'url': 'https://thumbs.dreamstime.com/b/sports-jersey-t-shirt-design-concept-vector-template-football-front-back-view-soccer-cricket-volleyball-rugby-tennis-212933795.jpg',
        'description': 'Sports Jersey with Chinese Collar',
        'price': '\$29.00',
        'isFavorite': false,
      },
    ],
    'Hoodies': [
      {
        'url': 'https://m.media-amazon.com/images/I/61KJ3oES13L._AC_UL1500_.jpg',
        'description': 'Comfortable Hoodie - Black',
        'price': '\$40.00',
        'isFavorite': false,
      },
      {
        'url': 'https://m.media-amazon.com/images/I/61FuANv4xWL._AC_SL1500_.jpg',
        'description': 'Casual Hoodie - Grey',
        'price': '\$42.00',
        'isFavorite': false,
      },
      {
        'url': 'https://m.media-amazon.com/images/I/61DqrUprmwL._AC_SL1500_.jpg',
        'description': 'Sports Hoodie - Red',
        'price': '\$45.00',
        'isFavorite': false,
      },
      {
        'url': 'https://m.media-amazon.com/images/I/61y8W3tMsnL._AC_UY1100_.jpg',
        'description': 'Fashionable Hoodie - Blue',
        'price': '\$48.00',
        'isFavorite': false,
      },
      {
        'url': 'https://m.media-amazon.com/images/I/71PzDVEGRmL._AC_SL1500_.jpg',
        'description': 'Warm Hoodie - Green',
        'price': '\$50.00',
        'isFavorite': false,
      },
    ],
  };

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
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/favorite');
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: Text(
                'Favorite',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
              ),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildCategoryButton('Regular'),
                buildCategoryButton('NBA Cut'),
                buildCategoryButton('T-Shirt'),
                buildCategoryButton('Warmer'),
                buildCategoryButton('Polo Regular'),
                buildCategoryButton('Chinese Collar'),
                buildCategoryButton('Hoodies'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categoryProducts[selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                var product = categoryProducts[selectedCategory]?[index] ?? {};
                String imageUrl = product['url'] ?? '';
                String description = product['description'] ?? '';
                String price = product['price'] ?? '';
                bool isFavorite = product['isFavorite'] ?? false;

                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(imageUrl),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          price,
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  product['isFavorite'] = !isFavorite;
                                });
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle Add button action here
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added to cart'),
                                  ),
                                );
                              },
                              child: Text('Add'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryButton(String category) {
    bool isSelected = selectedCategory == category;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedCategory = category;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
