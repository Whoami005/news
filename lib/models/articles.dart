import 'package:news/models/source.dart';

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'] ?? "Автор неизвестен",
      title: json['title'] ?? "Заголовок отсутствует",
      description: json['description'] ?? " ",
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.tryParse(json['publishedAt']),
      content: json['content'] ?? " ",
    );
  }
}
