import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomie_radar/consts/colors.dart';
import 'package:roomie_radar/views/property_details/property_details.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/images.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});
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
              10.heightBox,
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
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
                          //Top right heart icon
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
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
