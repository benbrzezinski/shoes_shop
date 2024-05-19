import 'package:shoes_shop/data/products.dart';

List<Map<String, Object>> getFilteredProducts(
    {required String searchBarValue, required String selectedFilter}) {
  final filteredProducts = products
      .where((product) => (product["title"] as String)
          .toLowerCase()
          .contains(searchBarValue.toLowerCase().trim()))
      .toList();

  if (selectedFilter == "All") return filteredProducts;

  return filteredProducts
      .where(
          (product) => (product["company"] as String).contains(selectedFilter))
      .toList();
}
