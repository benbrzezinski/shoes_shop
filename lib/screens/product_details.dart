import 'package:flutter/material.dart';
import 'package:shoes_shop/widgets/product_details_title.dart';
import 'package:shoes_shop/widgets/product_details_img.dart';
import 'package:shoes_shop/widgets/product_details_price.dart';
import 'package:shoes_shop/widgets/list_of_sizes.dart';
import 'package:shoes_shop/widgets/product_details_btn.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final Map<String, Object> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          ProductDetailsTitle(title: product["title"] as String),
          const Spacer(),
          ProductDetailsImg(imageUrl: product["imageUrl"] as String),
          const Spacer(),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductDetailsPrice(price: product["price"] as double),
                ListOfSizes(sizes: product["sizes"] as List<int>),
                const ProductDetailsBtn()
              ],
            ),
          )
        ],
      ),
    );
  }
}
