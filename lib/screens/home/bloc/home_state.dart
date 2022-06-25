part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  search,
  errorServer,
}

class HomeState {
  final HomeStatus _status;
  final News? _news;
  final List<Articles>? _articles;
  final bool _flag;
  final String _errorMessage;

  const HomeState({
    required HomeStatus status,
    News? news,
    List<Articles>? articles,
    bool flag = true,
    required String errorMessage,
  })  : _status = status,
        _news = news,
        _flag = flag,
        _articles = articles,
        _errorMessage = errorMessage;

  bool get flag => _flag;

  List<Articles>? get articles => _articles;

  String get errorMessage => _errorMessage;

  News? get news => _news;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    News? news,
    List<Articles>? articles,
    bool? flag,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? _status,
      news: news ?? _news,
      articles: articles ?? _articles,
      flag: flag ?? _flag,
      errorMessage: errorMessage ?? _errorMessage,
    );
  }
}
