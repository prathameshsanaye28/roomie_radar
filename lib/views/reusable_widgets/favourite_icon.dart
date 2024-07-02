import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final Color? iconColor;
  final double? iconSize;
  const FavoriteIcon(
      {super.key, required this.iconColor, required this.iconSize});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: widget.iconColor,
          size: widget.iconSize,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
