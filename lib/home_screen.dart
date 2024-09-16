import 'package:flutter/material.dart';
import 'package:homehub/favorites_screen.dart';
import 'package:homehub/profile_screen.dart';
import 'property_detail_screen.dart';
import 'search_screen.dart';
import 'category_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button click
              showSearch(
                context: context,
                delegate: PropertySearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories Section
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  CategoryCard(
                    icon: Icons.home,
                    label: 'For Sale',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetailScreen(category: 'For Sale'),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.home_mini_outlined,
                    label: 'For Rent',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetailScreen(category: 'For Rent'),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.location_city,
                    label: 'Apartments',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetailScreen(category: 'Apartments'),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.villa,
                    label: 'Villas',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetailScreen(category: 'Villas'),
                        ),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Featured Listings Section
              Text(
                'Featured Listings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  PropertyCard(
                    title: 'Modern Apartment',
                    price: '\$120,000',
                    description:
                    'A beautiful modern apartment located in the city center.',
                  ),
                  PropertyCard(
                    title: 'Cozy Villa',
                    price: '\$250,000',
                    description:
                    'A cozy villa with a beautiful garden and pool.',
                  ),
                  PropertyCard(
                    title: 'Luxurious Penthouse',
                    price: '\$450,000',
                    description:
                    'A luxurious penthouse with a panoramic view of the city.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'Favorites',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            } else if (index == 2) {
              // Replace this with actual favorites screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigate to ProfileScreen
              );
            }
          }
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CategoryCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  // final String imageUrl;
  final String title;
  final String price;
  final String description;

  const PropertyCard({
    // required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to the property detail screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyDetailScreen(
                // imageUrl: imageUrl,
                title: title,
                price: price,
                description: description,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(price,
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Suggestion $index'),
          onTap: () {
            close(context, 'Suggestion $index');
          },
        );
      },
    );
  }
}
