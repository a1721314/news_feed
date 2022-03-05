import '../data/category_info.dart';
import '../data/search_type.dart';
import 'package:flutter/material.dart';

class NewsRepository {
  Future<void> getNews(
      {required SearchType searchType, String? keyword, Category? category}) async{
        //TODO
        print(
        "[Repository] searchType: $searchType / keyword: $keyword / category: $category.nameJP");
      }
}
