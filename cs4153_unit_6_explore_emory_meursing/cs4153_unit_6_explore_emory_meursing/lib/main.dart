// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'destination_detail.dart';

void main() {
  runApp(TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: DestinationListScreen(),
    );
  }
}

class DestinationListScreen extends StatelessWidget {
  final List<Destination> destinations = [
    Destination(
      name: 'Paris',
      imagePath: 'assets/paris.jpg',
      description: 'Paris is known as the City of Light. It\'s home to the Eiffel Tower and world-class cuisine.',
    ),
    Destination(
      name: 'Tokyo',
      imagePath: 'assets/tokyo.jpg',
      description: 'Tokyo is a vibrant city blending modern skyscrapers and traditional temples.',
    ),
    Destination(
      name: 'New York',
      imagePath: 'assets/nyc.jpg',
      description: 'New York City is famous for Times Square, Broadway, and the Statue of Liberty.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel Destinations')),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Image.asset(destination.imagePath, width: 50, fit: BoxFit.cover),
              title: Text(destination.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DestinationDetailScreen(destination: destination),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Destination {
  final String name;
  final String imagePath;
  final String description;

  Destination({required this.name, required this.imagePath, required this.description});
}
