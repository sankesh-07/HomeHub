import 'package:flutter/material.dart';
import 'property_detail_screen.dart';
//
// class PropertyListingScreen extends StatelessWidget {
//   final List<Map<String, String>> properties = [
//     {'name': 'Luxury Villa', 'location': 'California', 'price': '\$1,200,000'},
//     {'name': 'Modern Apartment', 'location': 'New York', 'price': '\$800,000'},
//     {'name': 'Beach House', 'location': 'Miami', 'price': '\$950,000'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Property Listings'),
//       ),
//       body: ListView.builder(
//         itemCount: properties.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(properties[index]['name']!),
//             subtitle: Text(properties[index]['location']!),
//             trailing: Text(properties[index]['price']!),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PropertyDetailScreen(
//                     property: properties[index],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
