import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/models/articles.dart';
import 'package:news/screens/news/bloc/news_cubit.dart';
import 'package:news/screens/news/widgets/app_bar.dart';
import 'package:news/screens/news/widgets/news_card.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatelessWidget {
  final Articles _articles;

  const NewsScreen({
    Key? key,
    required Articles articles,
  })  : _articles = articles,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (BuildContext context, state) {
          if (state.status == NewsStatus.initial) {
            return Scaffold(
              appBar: NewsAppBar(
                articles: _articles,
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    if (_articles.urlToImage != null)
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.network(
                          _articles.urlToImage!,
                          errorBuilder: (context, error, stackTrace) =>
                              SvgPicture.network(_articles.urlToImage!),
                        ),
                      ),
                    NewsCard(articles: _articles),
                  ],
                ),
              ),
            );
          }
          if (state.status == NewsStatus.web) {
            return Scaffold(
              body: SafeArea(
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: _articles.url,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.read<NewsCubit>().exitWeb();
                },
                child: const Icon(Icons.arrow_back),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
