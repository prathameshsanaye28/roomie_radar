import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie_radar/consts/colors.dart';
import 'package:roomie_radar/consts/images.dart';
import 'package:roomie_radar/consts/strings.dart';
import 'package:roomie_radar/controllers/home_controller.dart';
import 'package:roomie_radar/views/favourites_screen/favourites_screen.dart';
import 'package:roomie_radar/views/home_screen/home_screen.dart';
import 'package:roomie_radar/views/profile_screen/profile.dart';
import 'package:roomie_radar/views/profile_screen/profile.dart';
import 'package:roomie_radar/views/yourListings_screen/your_listings_screen.dart';
import '../profile_screen/profile_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //init controller
    var controller = Get.put(HomeController());

    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icHeart, width: 26), label: favourites),
      BottomNavigationBarItem(
          icon: Image.asset(icList, width: 26), label: yourListings),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
    ];

    var navBody = [
      const HomeScreen(),
      const FavouritesScreen(),
      const YourListingsScreen(),
      ProfileScreen(
        ownerProfile: user,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: darkBlue,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(184, 190, 218, 251),
          items: navBarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
