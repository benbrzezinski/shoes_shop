import 'package:flutter/material.dart';
import 'package:shoes_shop/screens/product_details.dart';
import 'package:shoes_shop/widgets/shoes_card.dart';

class ListOfShoes extends StatelessWidget {
  const ListOfShoes({super.key, required this.products});

  final List<Map<String, Object>> products;

  Widget itemBuilder(BuildContext context, int i, double maxWidth) {
    final product = products[i];
    final title = product["title"] as String;
    final price = product["price"] as double;
    final imageUrl = product["imageUrl"] as String;
    final backgroundColor = i.isEven
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.secondary;
    final margin = i == 0 && maxWidth < 1091
        ? const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 20)
        : const EdgeInsets.symmetric(vertical: 20, horizontal: 15);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(product: product),
          ),
        );
      },
      child: ShoesCard(
        title: title,
        price: price,
        imageUrl: imageUrl,
        backgroundColor: backgroundColor,
        margin: margin,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => constraints.maxWidth > 1090
                  ? GridView.builder(
                      clipBehavior: Clip.antiAlias,
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            constraints.maxWidth > 1400 ? 1.9 : 1.5,
                      ),
                      itemBuilder: (context, i) =>
                          itemBuilder(context, i, constraints.maxWidth),
                    )
                  : ListView.builder(
                      clipBehavior: Clip.antiAlias,
                      itemCount: products.length,
                      itemBuilder: (context, i) =>
                          itemBuilder(context, i, constraints.maxWidth),
                    ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "No products found",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.grey[700]),
            ),
          );
  }
}
