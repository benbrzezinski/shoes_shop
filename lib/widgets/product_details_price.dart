import 'package:flutter/material.dart';

class ProductDetailsPrice extends StatelessWidget {
  const ProductDetailsPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$$price",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
