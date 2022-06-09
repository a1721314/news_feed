import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/viewmodels/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<HeadLineViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }

    return SafeArea(
      child: Scaffold(
        //TODO
        body: Container(
          child: Consumer<HeadLineViewModel>(
            builder: (context, model, child) {
              return PageView.builder(
                  controller: PageController(),
                  itemCount: model.articles.length,
                  itemBuilder: (context, index) {
                    final article = model.articles[index];
                    return Container(
                      color: Colors.blueAccent,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(article.title ?? ""),
                            Text(article.description ?? "")
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => onRefresh(context),
        ),
      ),
    );
  }

  //TO DO 更新処理
  onRefresh(BuildContext context) async {
    print("HeadLinePage.onRefresh");
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }
}
