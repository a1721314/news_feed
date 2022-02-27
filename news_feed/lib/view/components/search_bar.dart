import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: const BorderRadius.all(const Radius.circular(24.0))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: TextField(
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "検索ワードを入れてください",
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}