import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shop/providers/cart.dart';
import 'package:shoes_shop/screens/product_details.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final Map<String, Object> cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(cartItem["imageUrl"] as String),
        radius: 30,
      ),
      title: Text(
        cartItem["title"] as String,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Price: \$${cartItem["price"]}"),
          Text("Size: ${cartItem["size"]}")
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    "Delete product",
                    textAlign: TextAlign.center,
                  ),
                  titleTextStyle: Theme.of(context).textTheme.titleMedium,
                  content: const Text(
                    "Are you sure you want to remove this product from your cart?",
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "No",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<CartProvider>().removeFromCart(cartItem);
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                );
              });
        },
        icon: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.red,
          semanticLabel: "trash bin",
        ),
        tooltip: "Delete",
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: cartItem,
              size: cartItem["size"] as int,
            ),
          ),
        );
      },
    );
  }
}
