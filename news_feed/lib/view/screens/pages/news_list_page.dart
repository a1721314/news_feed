import 'package:flutter/material.dart';

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
                            SearchBar(),
                            //TODO カテゴリー選択Chips
                            //CategoryChips(),
                            //TODO 記事表示
                            Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                //TODO 記事更新処理
                onReflesh(BuildContext context) {}
}