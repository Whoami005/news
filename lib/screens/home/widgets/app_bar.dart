import 'package:flutter/material.dart';
import 'package:news/models/news.dart';
import 'package:news/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final News? _news;
  final double? height;

  const HomeAppBar({
    Key? key,
    this.height = kToolbarHeight,
    required News? news,
  })  : _news = news,
        super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<NewsTheme>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News - ${_news!.totalResults}",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => theme.setTheme(),
            icon: const Icon(Icons.emoji_objects),
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
