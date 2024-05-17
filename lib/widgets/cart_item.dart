import 'package:flutter/material.dart';
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
      subtitle: Text("Size: ${cartItem["size"]}"),
      trailing: IconButton(
        onPressed: () {},
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
            builder: (context) => ProductDetails(product: cartItem),
          ),
        );
      },
    );
  }
}
