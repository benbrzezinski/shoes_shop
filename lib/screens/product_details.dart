import 'package:flutter/material.dart';
import 'package:shoes_shop/widgets/product_details_title.dart';
import 'package:shoes_shop/widgets/product_details_img.dart';
import 'package:shoes_shop/widgets/product_details_price.dart';
import 'package:shoes_shop/widgets/list_of_sizes.dart';
import 'package:shoes_shop/widgets/product_details_btn.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product, this.size});

  final Map<String, Object> product;
  final int? size;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.size ?? 0;
  }

  void setSelectedSize(int size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          ProductDetailsTitle(title: widget.product["title"] as String),
          const Spacer(),
          ProductDetailsImg(imageUrl: widget.product["imageUrl"] as String),
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
                ProductDetailsPrice(price: widget.product["price"] as double),
                ListOfSizes(
                  sizes: widget.product["sizes"] as List<int>,
                  selectedSize: selectedSize,
                  setSelectedSize: setSelectedSize,
                ),
                ProductDetailsBtn(
                  product: widget.product,
                  selectedSize: selectedSize,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
