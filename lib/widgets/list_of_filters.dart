import 'package:flutter/material.dart';
import 'package:shoes_shop/widgets/filter_item.dart';

class ListOfFilters extends StatefulWidget {
  const ListOfFilters({super.key});

  @override
  State<ListOfFilters> createState() => _ListOfFiltersState();
}

class _ListOfFiltersState extends State<ListOfFilters> {
  final filters = ["All", "Adidas", "Nike", "Puma"];
  late String selectedFilter;

  void setSelectedFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

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

            return FilterItem(
                filter: filter,
                selectedFilter: selectedFilter,
                setSelectedFilter: setSelectedFilter);
          }),
    );
  }
}
