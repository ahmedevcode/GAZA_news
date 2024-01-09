import 'package:flutter/material.dart';
import '../models/article_model.dart';

import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  List<ArticleModel> articles;

   NewsListView({super.key ,required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount:  articles.length,
            (context, index) {
          return  Padding(
            padding: EdgeInsets.only(bottom: 22),
            child: NewsTile(
              articleModel: articles[index],
            ),
          );
        },
      ),
    );
  }
}
