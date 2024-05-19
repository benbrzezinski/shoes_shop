import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/providers/cart.dart';
import 'package:shoes_shop/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    final total =
        cart.fold(0.0, (acc, item) => acc + (item["price"] as double));

    return cart.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                    clipBehavior: Clip.antiAlias,
                    itemCount: cart.length,
                    itemBuilder: (context, i) {
                      final cartItem = cart[i];
                      return CartItem(cartItem: cartItem);
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Text(
                  "Total: \$$total",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        : Center(
            child: Text(
              "Your shopping cart is empty",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          );
  }
}
