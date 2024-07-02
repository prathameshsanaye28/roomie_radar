import 'package:flutter/material.dart';
import 'package:roomie_radar/consts/colors.dart';

class UpComingFeature extends StatelessWidget {
  const UpComingFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: MyGradients.myGradient,
      ),
      child: const Padding(
        padding: EdgeInsets.all(80.0),
        child: Text(
          "Coming Soon...",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: darkBlue,
          ),
        ),
      ),
    );
  }
}
