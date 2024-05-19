import 'package:flutter/material.dart';

class TitleSearchBar extends StatelessWidget {
  const TitleSearchBar({super.key, required this.setSearchBarValue});

  final void Function(String) setSearchBarValue;

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Text(
              "Shoes\nCollection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  semanticLabel: "magnifier",
                ),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                contentPadding: EdgeInsets.all(15),
              ),
              onChanged: (value) {
                setSearchBarValue(value);
              },
            ),
          )
        ],
      ),
    );
  }
}
