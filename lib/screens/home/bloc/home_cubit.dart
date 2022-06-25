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
    final comparison = state._news!.articles!.where((element) {
      final title = element.title!.toLowerCase();
      final input = news.toLowerCase();

      return title.contains(input);
    }).toList();
    emit(state.copyWith(status: HomeStatus.search, articles: comparison));
  }
}
