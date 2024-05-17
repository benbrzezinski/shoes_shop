import 'package:flutter/material.dart';
import 'package:shoes_shop/data/shoes.dart';
import 'package:shoes_shop/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        clipBehavior: Clip.antiAlias,
        itemCount: cart.length,
        itemBuilder: (context, i) {
          final cartItem = cart[i];
          return CartItem(cartItem: cartItem);
        });
  }
}
