import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final BoxFit fit;
  final VoidCallback onTap;

  BannerWidget({
    required this.imageUrl,
    this.height = 200.0,
    this.fit = BoxFit.cover,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        child: Image.network(
          imageUrl,
          fit: fit,
        ),
      ),
    );
  }
}
