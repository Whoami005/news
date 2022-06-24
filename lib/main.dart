import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/repositories/news_repository.dart';
import 'package:news/screens/home/bloc/home_cubit.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => NewsTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<NewsTheme>();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NewsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(repository: NewsRepository()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.getTheme(),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
