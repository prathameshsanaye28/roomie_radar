import 'package:flutter/material.dart';

const Color textfieldGrey = Color.fromRGBO(209, 209, 209, 1);
const Color darkBlue = Color.fromARGB(255, 4, 54, 74);
const Color tealBlue = Color.fromARGB(255, 23, 107, 135);
const Color greenTeal = Color.fromARGB(255, 100, 204, 197);
const Color lightBlue = Color.fromARGB(255, 218, 255, 251);

class MyGradients {
  static const LinearGradient myGradient = LinearGradient(
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
  );
}
