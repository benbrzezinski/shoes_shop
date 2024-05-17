import 'package:flutter/material.dart';
import 'package:shoes_shop/widgets/cart_list.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: const CartList(),
    );
  }
}
