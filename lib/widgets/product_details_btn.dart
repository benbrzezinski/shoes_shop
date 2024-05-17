import 'package:flutter/material.dart';

class ProductDetailsBtn extends StatelessWidget {
  const ProductDetailsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(12),
        ),
        icon: const Icon(
          Icons.shopping_cart_outlined,
          size: 26,
          color: Colors.black,
          semanticLabel: "shopping cart",
        ),
        label: const Text(
          "Add To Cart",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        onPressed: () {},
      ),
    );
  }
}
