import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Properties'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (query) {
                // Perform search action here
                // For demonstration, navigate to a dummy results screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultsScreen(query: query),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Text(
                  'Enter a search term to find properties.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultsScreen extends StatelessWidget {
  final String query;

  const SearchResultsScreen({required this.query});

  @override
  Widget build(BuildContext context) {
    // Dummy search results
    List<String> searchResults = [
      'Property 1',
      'Property 2',
      'Property 3',
      // Add more dummy results here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results for "$query"'),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index]),
            onTap: () {
              // Navigate to a detailed property screen or perform another action
            },
          );
        },
      ),
    );
  }
}
