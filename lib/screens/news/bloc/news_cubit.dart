import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(const NewsState(status: NewsStatus.initial));

  void inWeb() {
    emit(state.copyWith(status: NewsStatus.web));
  }

  void exitWeb() {
    emit(state.copyWith(status: NewsStatus.initial));
  }
}
