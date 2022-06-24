import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news/models/articles.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final Articles _articles;

  const NewsAppBar({
    Key? key,
    this.height = kToolbarHeight,
    required Articles articles,
  })  : _articles = articles,
        super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          _articles.author!,
          maxLines: 1,
          minFontSize: 10,
        ),
        centerTitle: true,
      ),
    );
  }
}
