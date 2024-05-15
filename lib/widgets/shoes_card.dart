import 'package:flutter/material.dart';

class ShoesCard extends StatelessWidget {
  const ShoesCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.backgroundColor,
      this.margin});

  final String title;
  final double price;
  final String imageUrl;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Center(
            child: Image.asset(
              imageUrl,
              height: 250,
              semanticLabel: "picture of shoes",
              filterQuality: FilterQuality.medium,
            ),
          )
        ],
      ),
    );
  }
}
