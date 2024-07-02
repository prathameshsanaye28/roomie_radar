import 'package:flutter/material.dart';
import 'package:roomie_radar/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField(String? title, String? hint, controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(darkBlue).size(16).make(),
      5.heightBox,
      TextFormField(
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.black54,
          ),
          hintText: hint,
          isDense: true,
          fillColor: const Color.fromRGBO(112, 163, 184, 0.15),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}
