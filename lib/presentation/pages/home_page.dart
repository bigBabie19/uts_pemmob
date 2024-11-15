import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: SingleChildScrollView(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Discover Indonesia',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search destinations or activities...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Popular Destinations
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Destinations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text('See All')),
                ],
              ),
            ),
            // Horizontal ListView of destinations
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DestinationCard('Bali', 'assets/images/bali.jpeg', 'Beautiful beaches and temples in Bali'),
                  DestinationCard('Yogyakarta', 'assets/images/yogyakarta.jpeg', 'Historical city with rich cultural heritage'),
                  DestinationCard('Jakarta', 'assets/images/Jakarta.jpeg', 'Vibrant capital city with modern architecture'),
                  DestinationCard('Lombok', 'assets/images/lombok.jpeg', 'Scenic island with stunning natural beauty'),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Featured Activities
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Activities', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text('See All')),
                ],
              ),
            ),
            // GridView for Featured Activities
            Container(
              height: 300, // Set a height for the GridView
              child: GridView.count(
                shrinkWrap: true,  // Ensures GridView does not take up more space than it needs
                physics: NeverScrollableScrollPhysics(),  // Disable GridView scrolling
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: [
                  ActivityCard('Tari Kecak Bali', 'assets/images/tarikecak.jpeg', 'Traditional Balinese dance performance'),
                  ActivityCard('Malioboro Tour', 'assets/images/malioborotour.jpeg', 'Explore the vibrant streets of Yogyakarta'),
                ],
              ),
            ),
          ],
        ),
      ),
      selectedIndex: 0, // Home tab is selected
      controller: controller,
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  DestinationCard(this.title, this.imagePath, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 120, width: 150),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(description, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  ActivityCard(this.title, this.imagePath, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 120, width: 150),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(description, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}