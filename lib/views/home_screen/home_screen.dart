import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:roomie_radar/consts/colors.dart';
import 'package:roomie_radar/consts/images.dart';
import 'package:roomie_radar/consts/lists.dart';
import 'package:roomie_radar/consts/strings.dart';
import 'package:roomie_radar/views/property_details/property_details.dart';
import 'package:roomie_radar/views/reusable_widgets/favourite_icon.dart';
import 'package:roomie_radar/views/reusable_widgets/resuable_widget.dart';
import 'package:roomie_radar/views/search/adopt_home.dart';
import 'package:roomie_radar/views/upcoming_feature/upcoming_feature.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        gradient: MyGradients.myGradient,
      ),
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find Your",
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          "Perfect PG Living",
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(184, 190, 218, 251),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: logoWidget("assets/images/logo.png", 70.0, 70.0),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdoptPage(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(112, 163, 184, 0.15),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: searchHint,
                              isDense: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  children: [
                    Text(
                      "Our Tie Up Institutes",
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              VxSwiper.builder(
                aspectRatio: 16 / 9,
                autoPlay: true,
                height: 180,
                enlargeCenterPage: true,
                itemCount: tieUpsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpComingFeature(),
                        ),
                      );
                      print('Image tapped at index $index');
                    },
                    child: Image.asset(
                      tieUpsList[index],
                      fit: BoxFit.fill,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(const EdgeInsets.symmetric(horizontal: 8.0))
                        .make(),
                  );
                },
              ),
              12.heightBox,
              const Divider(
                height: 1,
                thickness: 1,
                color: darkBlue,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  children: [
                    Text(
                      "Properties near you",
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 220,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 185,
                    decoration: const BoxDecoration(
                      color: tealBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Card(
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 10.0),
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 220,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(icH1),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 20.0, 20.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Top left container
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              184, 190, 218, 251),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ), // Your color here
                                        child: const Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                "2",
                                                style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                  color: darkBlue,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Vacancies",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: darkBlue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ) // Your content here
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  const Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Dummy Property Name",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "\$1000",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Dummy Location",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.zoom_out_map,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "100 sq/m",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "4 Reviews",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Top right heart icon
                          const FavoriteIcon(
                            iconColor: Colors.white,
                            iconSize: 32.0,
                          ),
                        ],
                      ),
                    ).onTap(
                          () {
                        Get.to(
                              () => const PropertyDetail(
                              title: "Dummy Property Name"),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
