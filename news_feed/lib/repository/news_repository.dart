import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_feed/main.dart';
import 'package:news_feed/model/news_model.dart';

import '../data/category_info.dart';
import '../data/search_type.dart';
import 'package:flutter/material.dart';

import 'package:news_feed/util/extensions.dart';

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
      //results = News.fromJson(jsonDecode(responseBody)).articles;
      results = await insertAndReadFromDB(jsonDecode(responseBody));
    } else {
      throw Exception('Failed to load news');
    }

    return results;
  }

  Future<List<Article>> insertAndReadFromDB(responseBody) async {
    final dao = myDatabase.newsDao;
    final articles = News.fromJson(responseBody).articles;

    //TODO Webから取得した記事リスト（Dartのモデルクラス：Article）をDBのテーブルクラス（Articles）に変換してDB登録・DBから取得
    final articleRecords =
        await dao.insertAndReadNewsFromDB(articles.toArticleRecords(articles));

    //TODO DBから取得したデータをモデルクラスに再変換して返す
    return articleRecords.toArticleRecords(articleRecords);
  }
}
