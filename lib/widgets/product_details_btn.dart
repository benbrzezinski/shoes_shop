import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/providers/cart.dart';
import 'package:shoes_shop/screens/shared.dart';

class ProductDetailsBtn extends StatelessWidget {
  const ProductDetailsBtn(
      {super.key, required this.product, required this.selectedSize});

  final Map<String, Object> product;
  final int selectedSize;

  bool isInCart(BuildContext context) {
    final i = context
        .watch<CartProvider>()
        .cart
        .indexWhere((item) => item["id"] == product["id"]);

    return i != -1 ? true : false;
  }

  void goToCart(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Shared(
          initialPage: 1,
        ),
      ),
    );
  }

  void addToCart(BuildContext context) {
    if (selectedSize == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          "Please select the correct size",
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(label: "Close", onPressed: () {}),
        width: 320,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(4),
      ));
    } else {
      context
          .read<CartProvider>()
          .addToCart({...product, "size": selectedSize});

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          "Product added successfully",
          textAlign: TextAlign.center,
        ),
        action: SnackBarAction(
            label: "Go To Cart",
            onPressed: () {
              goToCart(context);
            }),
        width: 320,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(4),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: isInCart(context)
          ? ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(12),
              ),
              icon: const Icon(
                Icons.check_circle_outline_rounded,
                size: 26,
                color: Colors.black,
                semanticLabel: "check mark in a circle",
              ),
              label: const Text(
                "Added To Cart",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              onPressed: null)
          : ElevatedButton.icon(
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
              onPressed: () {
                addToCart(context);
              },
            ),
    );
  }
}
