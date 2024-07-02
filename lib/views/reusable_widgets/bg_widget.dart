import 'package:flutter/material.dart';

Widget bgWidget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(217, 217, 236, 255),
          Color.fromARGB(215, 216, 229, 255),
          Color(0xD5D5E9FF),
          Color(0xB9B9D9FF),
          Color.fromARGB(149, 214, 238, 252),
          Color.fromARGB(217, 217, 229, 255),
        ],
      ),
    ),
    child: child,
  );
}
