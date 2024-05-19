import 'package:flutter/material.dart';

class ListOfSizes extends StatelessWidget {
  const ListOfSizes(
      {super.key,
      required this.sizes,
      required this.selectedSize,
      required this.setSelectedSize});

  final List<int> sizes;
  final int selectedSize;
  final void Function(int) setSelectedSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.antiAlias,
          itemCount: sizes.length,
          itemBuilder: (context, i) {
            final size = sizes[i];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setSelectedSize(size);
                },
                child: Chip(
                  label: Text("$size"),
                  backgroundColor: size == selectedSize
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
              ),
            );
          }),
    );
  }
}
