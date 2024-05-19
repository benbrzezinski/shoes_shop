import 'package:flutter/material.dart';
import 'package:shoes_shop/widgets/filter_item.dart';

class ListOfFilters extends StatelessWidget {
  const ListOfFilters(
      {super.key,
      required this.filters,
      required this.selectedFilter,
      required this.setSelectedFilter});

  final List<String> filters;
  final String selectedFilter;
  final void Function(String) setSelectedFilter;

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
