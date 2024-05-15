import 'package:flutter/material.dart';

class ListOfSizes extends StatefulWidget {
  const ListOfSizes({super.key, required this.sizes});

  final List<int> sizes;

  @override
  State<ListOfSizes> createState() => _ListOfSizesState();
}

class _ListOfSizesState extends State<ListOfSizes> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.antiAlias,
          itemCount: widget.sizes.length,
          itemBuilder: (context, i) {
            final size = widget.sizes[i];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSize = size;
                  });
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
