import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_feed/model/news_model.dart';

import '../data/category_info.dart';
import '../data/search_type.dart';
import 'package:flutter/material.dart';

class NewsRepository {
  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "0295528e606f4f5291005a2bcfff514e";

  Future<List<Article>> getNews(
      {required SearchType searchType,
      String? keyword,
      Category? category}) async {
    List<Article> results = [];

    http.Response? response;

    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestURL = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestURL);
        break;
      case SearchType.KEYWORD:
        final requestURL =
            Uri.parse(BASE_URL + "&q=$keyword&pageSize=30&apikey=$API_KEY");
        response = await http.get(requestURL);
        break;
      case SearchType.CATEGORY:
        final requestURL = Uri.parse(
            BASE_URL + "&category=${category?.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestURL);
        break;
    }
    if (response.statusCode == 200) {
      final responseBody = response.body;
      results = News.fromJson(jsonDecode(responseBody)).articles;
    } else {
      throw Exception('Failed to load news');
    }

    return results;
  }
}
