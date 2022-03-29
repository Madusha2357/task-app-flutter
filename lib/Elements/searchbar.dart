import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: Color(0xFFe9eaec), 
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        cursorColor: Color(0xFF000000),
        //controller: _searchController,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF000000).withOpacity(0.5),
            ),
            hintText: "Search",
            border: InputBorder.none),
      ),
    );
  }
}
