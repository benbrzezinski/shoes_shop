import 'package:flutter/material.dart';

class ProductDetailsImg extends StatelessWidget {
  const ProductDetailsImg({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain,
        semanticLabel: "picture of shoes",
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}
