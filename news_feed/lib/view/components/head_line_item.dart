import 'package:flutter/material.dart';
import 'package:news_feed/model/news_model.dart';
import 'package:news_feed/view/components/image_from_url.dart';
import 'package:news_feed/view/components/page_transformer.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleClicked;

  HeadLineItem(
      {required this.article,
      required this.pageVisibility,
      required this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () => onArticleClicked(article),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ImageFromUrl(
              imageUrl: article.urlToImage,
            ),
            Positioned(
              bottom: 56.0,
              left: 32.0,
              right: 32.0,
              child: Text(
                article.title ?? "", 
                style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
