import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/articles.dart';
import 'package:news/models/news.dart';
import 'package:news/repositories/news_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NewsRepository _repository;

  HomeCubit({required repository})
      : _repository = repository,
        super(const HomeState(
          status: HomeStatus.initial,
          errorMessage: '',
          flag: true,
        ));

  Future getNews() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final response = await _repository.fetch();

      emit(state.copyWith(status: HomeStatus.loaded, news: response));
    } catch (error) {
      emit(state.copyWith(
          status: HomeStatus.errorServer, errorMessage: error.toString()));
    }
  }

  void search(String news) {
    final comparison = state.news!.articles!.where((element) {
      final title = element.title!.toLowerCase();
      final input = news.toLowerCase();

      return title.contains(input);
    }).toList();

    if (state.flag == true) {
      comparison.sort((a, b) {
        return b.publishedAt!.compareTo(a.publishedAt!);
      });
    } else {
      comparison.sort((a, b) {
        return a.publishedAt!.compareTo(b.publishedAt!);
      });
    }

    emit(state.copyWith(
      status: HomeStatus.search,
      articles: comparison,
      sortedArticles: comparison,
    ));
  }

  void sortedOld() {
    emit(state.copyWith(flag: false));
    final result = state.status == HomeStatus.loaded
        ? state.news!.articles!
        : state.sortedArticles!;

    result.sort((a, b) {
      return a.publishedAt!.compareTo(b.publishedAt!);
    });

    emit(state.copyWith(articles: result));
  }

  void sortedNew() {
    emit(state.copyWith(flag: true));
    final result = state.status == HomeStatus.loaded
        ? state.news!.articles!
        : state.sortedArticles!;

    result.sort((a, b) {
      return b.publishedAt!.compareTo(a.publishedAt!);
    });

    emit(state.copyWith(articles: result));
  }
}
