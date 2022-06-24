part of 'news_cubit.dart';

enum NewsStatus {
  initial,
  web,
}

class NewsState {
  final NewsStatus _status;

  const NewsState({
    required NewsStatus status,
  }) : _status = status;

  NewsStatus get status => _status;

  NewsState copyWith({
    NewsStatus? status,
  }) {
    return NewsState(
      status: status ?? _status,
    );
  }
}
