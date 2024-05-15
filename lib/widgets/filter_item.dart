import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem(
      {super.key,
      required this.filter,
      required this.selectedFilter,
      required this.setSelectedFilter});

  final String filter;
  final String selectedFilter;
  final void Function(String) setSelectedFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          setSelectedFilter(filter);
        },
        child: Chip(
          label: Text(filter),
          labelStyle: const TextStyle(fontSize: 16),
          backgroundColor: filter == selectedFilter
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          side: BorderSide.none,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
