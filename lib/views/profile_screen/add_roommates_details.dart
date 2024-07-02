import 'package:flutter/material.dart';

import 'roommate.dart';

class AddRoommateDetailsScreen extends StatefulWidget {
  @override
  _AddRoommateDetailsScreenState createState() =>
      _AddRoommateDetailsScreenState();
}

class _AddRoommateDetailsScreenState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Roommate Details'),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: genderController,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String gender = genderController.text;
                  String age = ageController.text;
                  Roommate newRoommate =
                      Roommate(name, gender, age, ""); // No image provided
                  Navigator.pop(context,
                      newRoommate); // Return the new pet to the previous screen
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 147, 205, 225), // Background color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Add Roommate',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 63, 29, 56), // Text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
