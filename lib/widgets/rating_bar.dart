import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;
  final double size;

  RatingBar({
    required this.rating,
    this.itemCount = 5,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? activeColor : inactiveColor,
          size: size,
        ),
      ),
    );
  }
}
