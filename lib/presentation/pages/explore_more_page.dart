import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class ExploreMorePage extends StatelessWidget {
  final HomeController controller;

  ExploreMorePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Text(
                'Explore More',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // Explore Categories
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                children: [
                  ExploreCard(
                    'Culinary',
                    'Discover delicious Indonesian cuisine and traditional dishes.',
                    Icons.fastfood,
                  ),
                  ExploreCard(
                    'Culture',
                    'Experience the rich cultural heritage and traditions of Indonesia.',
                    Icons.theater_comedy,
                  ),
                  ExploreCard(
                    'Nature',
                    'Enjoy the stunning landscapes and natural beauty of Indonesia.',
                    Icons.nature,
                  ),
                  ExploreCard(
                    'Adventure',
                    'Engage in thrilling activities like hiking and diving.',
                    Icons.emoji_nature,
                  ),
                  ExploreCard(
                    'History',
                    'Learn about Indonesia\'s fascinating history and heritage.',
                    Icons.history,
                  ),
                  ExploreCard(
                    'Festivals',
                    'Join local festivals that celebrate culture and community.',
                    Icons.event,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      selectedIndex: 1, // Explore More tab is selected
      controller: controller,
    );
  }
}

class ExploreCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  ExploreCard(this.title, this.description, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.grey), // Changed icon color to grey
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}