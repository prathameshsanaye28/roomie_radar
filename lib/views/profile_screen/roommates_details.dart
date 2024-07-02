import 'package:flutter/material.dart';

class RoommateDetailsScreen extends StatelessWidget {
  final String roommateName;
  final String roommateImage;
  final String gender;
  final String age;

  const RoommateDetailsScreen(this.roommateName, this.roommateImage, this.gender, this.age);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roommate Details'),
        backgroundColor: const Color.fromRGBO(245, 218, 210, .20),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFCDD9F4),
                Color(0xFFF0F2F6),
                Color(0xFFEBEEF6),
                Color(0xFFEFF1F6),
                Color(0xFFCDD9F4),
                Color(0xFFF0F2F6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Roommate Details',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(roommateImage),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Name: $roommateName',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Gender: $gender',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Age: $age years',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}