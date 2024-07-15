import 'package:flutter/material.dart';
import 'package:flutter_product_carousel/flutter_product_carousel.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = 'Regular'; // Default selected category

  // Define product data for each category
  Map<String, List<String>> categoryProducts = {
    'Regular': [
      'https://t3.ftcdn.net/jpg/05/01/82/34/360_F_501823412_29LHygIVQhPfJgOnEpa6v9BOFsMZWwZ8.jpg',
      'https://static.vecteezy.com/system/resources/previews/011/477/281/non_2x/black-red-shirt-sport-jersey-design-vector.jpg',
      'https://static.vecteezy.com/system/resources/previews/017/352/537/non_2x/red-black-t-shirt-sport-jersey-design-vector.jpg',
      'https://static.vecteezy.com/ti/vetor-gratis/t1/9157952-design-de-camiseta-preta-esporte-vetor.jpg',
      'https://5.imimg.com/data5/VS/NP/IL/SELLER-60365930/sc-sports-399-500x500.jpg',
    ],
    'NBA Cut': [
      'https://img.lazcdn.com/g/p/eda418154d78fc6ea7c44cd6840c3570.jpg_720x720q80.jpg',
      'https://lzd-img-global.slatic.net/g/p/dcd221d41e616dd0af281a3a08c5731b.jpg_360x360q75.jpg_.webp',
      'https://lzd-img-global.slatic.net/g/p/269434e5f238fb3b059827f2818b277a.jpg_720x720q80.jpg',
    ],
    'T-Shirt': [
      'https://img.lazcdn.com/g/p/3e8afd87170d8f846854e96c420a8709.jpg_720x720q80.jpg',
      'https://example.com/tshirt_product2.jpg',
      'https://example.com/tshirt_product3.jpg',
    ],
    // Add more categories and their respective product URLs as needed
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
                String imageUrl =
                    categoryProducts[selectedCategory]?[index] ?? '';
                return ListTile(
                  title: Image.network(imageUrl),
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
