import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/articles.dart';
import 'package:news/screens/news/bloc/news_cubit.dart';
import 'package:news/theme/text_style.dart';

class NewsCard extends StatelessWidget {
  final Articles _articles;

  const NewsCard({
    Key? key,
    required Articles articles,
  })  : _articles = articles,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _articles.title!,
              style: NewsTextStyle.title25bold(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "${_articles.publishedAt!.toLocal()}",
              style: NewsTextStyle.title16bold(),
            ),
            const SizedBox(height: 20),
            Text(
              _articles.description!,
              style: NewsTextStyle.title18(),
            ),
            const SizedBox(height: 10),
            Text(
              _articles.content!,
              style: NewsTextStyle.title18(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  context.read<NewsCubit>().inWeb();
                },
                child: const Text("Перейти к статье"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
