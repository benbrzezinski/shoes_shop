import 'package:flutter/material.dart';
import 'package:shoes_shop/widgets/title_search_bar.dart';
import 'package:shoes_shop/widgets/list_of_filters.dart';
import 'package:shoes_shop/widgets/list_of_shoes.dart';
import 'package:shoes_shop/utils/get_filtered_products.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final filters = ["All", "Adidas", "Nike", "Puma"];
  late String selectedFilter;
  late List<Map<String, Object>> filteredProducts;
  String searchBarValue = "";

  void setFilteredProducts() {
    filteredProducts = getFilteredProducts(
        searchBarValue: searchBarValue, selectedFilter: selectedFilter);
  }

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
    setFilteredProducts();
  }

  void setSelectedFilter(String filter) {
    setState(() {
      selectedFilter = filter;
      setFilteredProducts();
    });
  }

  void setSearchBarValue(String value) {
    setState(() {
      searchBarValue = value;
      setFilteredProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    const double columnGap = 30;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Column(
          children: [
            TitleSearchBar(
              setSearchBarValue: setSearchBarValue,
            ),
            const SizedBox(
              height: columnGap,
            ),
            ListOfFilters(
              filters: filters,
              selectedFilter: selectedFilter,
              setSelectedFilter: setSelectedFilter,
            ),
            const SizedBox(
              height: columnGap,
            ),
            ListOfShoes(
              products: filteredProducts,
            )
          ],
        ),
      ),
    );
  }
}
