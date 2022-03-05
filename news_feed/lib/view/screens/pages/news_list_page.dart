import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../data/category_info.dart';
import '../../components/category_chips.dart';
import '../../components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onReflesh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //TODO 検索ワード
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              //TODO カテゴリー選択Chips
              CategoryChips(
                onCategorySelected: (category) =>
                    getCategoryNews(context, category),
              ),
              //TODO 記事表示
              Expanded(
                  child: Center(
                child: CircularProgressIndicator(),
              )),
            ],
          ),
        ),
      ),
    );
  }

  //TODO 記事更新処理
  Future<void> onReflesh(BuildContext context) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: viewModel.searchType,
        keyword: viewModel.keyword,
        category: viewModel.category);
    print("NewsListPage.onRefresh");
  }

  //TODO キーワード記事取得処理
  Future<void> getKeywordNews(BuildContext context, keyword) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: SearchType.KEYWORD,
        keyword: keyword,
        category: categories[0]);
    print("NewsListPage.getKeywordNews");
  }

  //TODO カテゴリー記事取得処理
  Future<void> getCategoryNews(BuildContext context, Category category) async{
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(searchType: SearchType.CATEGORY, category: category);
    print("NewsListPage.getCategoryNews / category: ${category.nameJp}");
  }
}
