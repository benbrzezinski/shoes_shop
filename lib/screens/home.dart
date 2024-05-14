import 'package:flutter/material.dart';
import 'package:shoes_shop/widgets/title_search_bar.dart';
import 'package:shoes_shop/widgets/list_of_filters.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const double columnGap = 30;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: const SafeArea(
          child: Column(
            children: [
              TitleSearchBar(),
              SizedBox(
                height: columnGap,
              ),
              ListOfFilters()
            ],
          ),
        ),
      ),
    );
  }
}
