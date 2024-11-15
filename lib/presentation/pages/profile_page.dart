import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class ProfilePage extends StatelessWidget {
  final HomeController controller;

  ProfilePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/78.jpg'), // Replace with your image
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yunus Cornelis Kabe', // Replace with dynamic user name
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'bigbabie@email.com', // Replace with dynamic user email
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 20),

              // Favorite Destinations
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Favorite Destinations',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // List of favorite destinations
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FavoriteDestinationCard('Bali', 'assets/images/bali.jpeg'),
                    FavoriteDestinationCard('Yogyakarta', 'assets/images/yogyakarta.jpeg'),
                    FavoriteDestinationCard('Jakarta', 'assets/images/Jakarta.jpeg'),
                    FavoriteDestinationCard('Lombok', 'assets/images/lombok.jpeg'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  // Implement logout functionality
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      selectedIndex: 2, // Profile tab is selected
      controller: controller,
    );
  }
}

class FavoriteDestinationCard extends StatelessWidget {
  final String title;
  final String imagePath;

  FavoriteDestinationCard(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 100, width: 120),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}