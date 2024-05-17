import 'package:flutter/material.dart';
import 'package:shoes_shop/screens/home.dart';
import 'package:shoes_shop/screens/cart.dart';

class Shared extends StatefulWidget {
  const Shared({super.key});

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  final pages = const [Home(), Cart()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                semanticLabel: "home",
              ),
              label: "",
              tooltip: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket_rounded,
                semanticLabel: "shopping basket",
              ),
              label: "",
              tooltip: "Cart")
        ],
        iconSize: 30,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
