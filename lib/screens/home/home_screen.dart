import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/home/bloc/home_cubit.dart';
import 'package:news/screens/home/widgets/app_bar.dart';
import 'package:news/screens/home/widgets/news_item.dart';
import 'package:news/widgets/custom_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (newsContext, newsState) {
          if (newsState.status == HomeStatus.errorServer) {
            CustomDialog.show(
              message: newsState.errorMessage,
              context: newsContext,
            );
          }
        },
        builder: (context, state) {
          if (state.status == HomeStatus.initial) {
            context.read<HomeCubit>().getNews();
          }
          if (state.status == HomeStatus.loaded ||
              state.status == HomeStatus.search) {
            return Scaffold(
              appBar: HomeAppBar(news: state.news),
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeCubit>().getNews();
                  },
                  child: Stack(
                    children: [
                      ListView.separated(
                        padding: const EdgeInsets.only(top: 120),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 10,
                                child: NewsItem(
                                  articles: state.status == HomeStatus.loaded
                                      ? state.news!.articles![index]
                                      : state.articles![index],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 5);
                        },
                        itemCount: state.status == HomeStatus.loaded
                            ? 100
                            : state.articles!.length,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Поиск",
                                border: const OutlineInputBorder(),
                                filled: true,
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              onChanged: (value) =>
                                  context.read<HomeCubit>().search(value),
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    if (state.flag == true) {
                                      context.read<HomeCubit>().sortedOld();
                                    } else {
                                      context.read<HomeCubit>().sortedNew();
                                    }
                                  },
                                  child: const Text("сортировка"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
