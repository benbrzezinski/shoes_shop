import 'package:flutter/material.dart';

class ListOfFilters extends StatefulWidget {
  const ListOfFilters({super.key});

  @override
  State<ListOfFilters> createState() => _ListOfFiltersState();
}

class _ListOfFiltersState extends State<ListOfFilters> {
  final filters = ["All", "Adidas", "Nike", "Puma"];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.antiAlias,
          itemCount: filters.length,
          itemBuilder: (context, i) {
            final filter = filters[i];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
                child: Chip(
                  label: Text(filter),
                  labelStyle: const TextStyle(fontSize: 16),
                  backgroundColor: selectedFilter == filter
                      ? Theme.of(context).colorScheme.primary
                      : const Color.fromRGBO(245, 247, 249, 1),
                  side: BorderSide.none,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            );
          }),
    );
  }
}
