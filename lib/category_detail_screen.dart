import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  const CategoryDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    // This is a dummy list of properties for the selected category.
    List<Map<String, String>> properties = [
      {'title': 'Property 1', 'price': '\$100,000'},
      {'title': 'Property 2', 'price': '\$200,000'},
      {'title': 'Property 3', 'price': '\$300,000'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Properties'),
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(properties[index]['title']!),
            subtitle: Text(properties[index]['price']!),
            onTap: () {
              // Navigate to the property detail screen or perform another action
              // For now, just showing a dialog with property details
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(properties[index]['title']!),
                    content: Text('Price: ${properties[index]['price']}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
