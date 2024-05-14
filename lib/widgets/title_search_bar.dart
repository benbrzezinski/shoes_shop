import 'package:flutter/material.dart';

class TitleSearchBar extends StatelessWidget {
  const TitleSearchBar({super.key});

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

    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 20),
            child: Text(
              "Shoes\nCollection",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  contentPadding: EdgeInsets.all(15)),
            ),
          )
        ],
      ),
    );
  }
}
