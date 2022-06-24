import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/models/articles.dart';
import 'package:news/screens/news/news_screen.dart';
import 'package:news/theme/text_style.dart';

class NewsItem extends StatelessWidget {
  final Articles _articles;

  const NewsItem({
    Key? key,
    required Articles articles,
  })  : _articles = articles,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsScreen(articles: _articles),
          ),
        );
      },
      leading: Image.asset(
        "assets/news.png",
        color: Theme.of(context).primaryColor,
      ),
      title: AutoSizeText(
        _articles.title!,
        maxLines: 2,
        minFontSize: 14,
        style: NewsTextStyle.title18bold(),
      ),
      subtitle: AutoSizeText(
        _articles.author!,
        maxLines: 1,
        minFontSize: 14,
        style: NewsTextStyle.title14bold(),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat("dd-MM-yyyy").format(_articles.publishedAt!.toLocal()),
            style: NewsTextStyle.title14bold(),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat("Hm").format(_articles.publishedAt!.toLocal()),
            style: NewsTextStyle.title14bold(),
          ),
        ],
      ),
    );
  }
}
