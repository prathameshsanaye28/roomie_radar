// profile_screen.dart
/*import 'package:flutter/material.dart';
import 'user_profile.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileScreen({Key? key, required this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 23, 107, 135),
              Color.fromARGB(255, 100, 204, 197),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(userProfile.imageUrl),
              ),
              const SizedBox(height: 20),
              Text(
                userProfile.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userProfile.dob,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userProfile.gender,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userProfile.contact,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userProfile.email,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                userProfile.address,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}*/

//Basic Profile Screen
/*import 'package:flutter/material.dart';
import 'user_profile.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileScreen({Key? key, required this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 23, 107, 135),
              Color.fromARGB(255, 100, 204, 197),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(userProfile.imageUrl),
              ),
              const SizedBox(height: 20),
              Text(
                userProfile.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildProfileItem('DOB', userProfile.dob),
              _buildProfileItem('Gender', userProfile.gender),
              _buildProfileItem('Contact', userProfile.contact),
              _buildProfileItem('Email', userProfile.email),
              _buildProfileItem('Address', userProfile.address),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

//Advanced Profile Screen
/*import 'package:flutter/material.dart';
import 'user_profile.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileScreen({Key? key, required this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400]!,
                  Colors.blue[900]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(userProfile.imageUrl),
                ),
                const SizedBox(height: 20),
                Text(
                  userProfile.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileItem('DOB', userProfile.dob),
                    _buildProfileItem('Gender', userProfile.gender),
                    _buildProfileItem('Contact', userProfile.contact),
                    _buildProfileItem('Email', userProfile.email),
                    _buildProfileItem('Address', userProfile.address),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.8, size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.4, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomie_radar/views/home_screen/home_screen.dart';
import '../auth_screen/signin_screen.dart';
import 'owner_profile.dart';
import 'my_list.dart'; 

class ProfileScreen extends StatefulWidget {
  final OwnerProfile ownerProfile;

  const ProfileScreen({Key? key, required this.ownerProfile}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }
  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });

      try {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (snapshot.exists) {
          setState(() {
            _userData = snapshot.data();
          });
        } else {
          // User data not found in Firestore
          print('User data not found');
        }
      } catch (e) {
        // Error fetching user data
        print('Error fetching user data: $e');
      }
    } else {
      // User is not signed in
      print('User is not signed in');
    }
  }
      @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _userData == null
          ? Center(child: CircularProgressIndicator())
          : Container(
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
        child: Stack(
          // Use Stack to layer the Log Out button on top
          children: [
            SingleChildScrollView(
              // Wrap the Column with SingleChildScrollView
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(widget.ownerProfile.imageUrl),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Full Name: ${_userData!['fullName']}',
                      //widget.ownerProfile.name,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildProfileItem('Username:', 'Username: ${_userData!['username']}'),
                    _buildProfileItem('Gender', widget.ownerProfile.gender),
                    _buildProfileItem('Contact', widget.ownerProfile.contact),
                    _buildProfileItem('Email', 'Email: ${_userData!['email']}'),
                    _buildProfileItem('Address', widget.ownerProfile.address),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyRoommates()), // Navigate to MyPetsScreen
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 27, 129, 213), // Background color
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'My Roommates',
                        style: TextStyle(
                          fontSize: 20,

                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // Position the Log Out button to the top right corner
              top: 16,
              right: 16,
              child: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );

                },
                icon: const Icon(Icons.logout),
                color: Colors.black,
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String heading, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 73, 36, 62)
              ),
            ),
          ),
        ],
      ),
    );
  }
}













