part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  errorServer,
}

class HomeState {
  final HomeStatus _status;
  final News? _news;
  final String _errorMessage;

  const HomeState({
    required HomeStatus status,
    News? news,
    required String errorMessage,
  })  : _status = status,
        _news = news,
        _errorMessage = errorMessage;

  String get errorMessage => _errorMessage;

  News? get news => _news;

  HomeStatus get status => _status;

  HomeState copyWith({
    HomeStatus? status,
    News? news,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? _status,
      news: news ?? _news,
      errorMessage: errorMessage ?? _errorMessage,
    );
  }
}
