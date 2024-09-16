import 'package:flutter/material.dart';
import 'property_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // List of favorite properties (this would be dynamically fetched or stored in actual implementation)
  List<Map<String, String>> favoriteProperties = [
    {
      'title': 'Modern Apartment',
      'price': '\$120,000',
      'description': 'A beautiful modern apartment located in the city center.',
    },
    {
      'title': 'Cozy Villa',
      'price': '\$250,000',
      'description': 'A cozy villa with a beautiful garden and pool.',
    },
    {
      'title': 'Luxurious Penthouse',
      'price': '\$450,000',
      'description': 'A luxurious penthouse with a panoramic view of the city.',
    },
  ];

  // Function to remove a property from the favorites list
  void removeProperty(int index) {
    setState(() {
      favoriteProperties.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteProperties.isNotEmpty
          ? ListView.builder(
        itemCount: favoriteProperties.length,
        itemBuilder: (context, index) {
          final property = favoriteProperties[index];
          return FavoritePropertyCard(
            title: property['title']!,
            price: property['price']!,
            description: property['description']!,
            onRemove: () => removeProperty(index), // Pass the remove function
          );
        },
      )
          : Center(
        child: Text(
          'No favorite properties yet!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FavoritePropertyCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final VoidCallback onRemove; // Function to remove the property

  const FavoritePropertyCard({
    required this.title,
    required this.price,
    required this.description,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigate to property detail screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyDetailScreen(
                title: title,
                price: price,
                description: description,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: onRemove, // Call the remove function when pressed
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                price,
                style: TextStyle(fontSize: 14, color: Colors.teal),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
