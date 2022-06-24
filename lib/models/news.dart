import 'package:news/models/articles.dart';

class News {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    final List<Articles> articles = [];
    json['articles'].forEach((json) {
      articles.add(Articles.fromJson(json));
    });
    return News(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
    );
  }
}
