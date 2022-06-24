import 'package:flutter/material.dart';
import 'package:news/theme/colors.dart';

class NewsTheme extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme;

  getTheme() => _currentTheme;

  setTheme() async {
    if (_currentTheme == lightTheme) {
      _currentTheme = darkTheme;
    } else {
      _currentTheme = lightTheme;
    }
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(primary: NewsColors.blueGrey),
      appBarTheme: const AppBarTheme(
        backgroundColor: NewsColors.blueGrey,
      ),
      primaryColor: NewsColors.black,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: NewsColors.blueGrey,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(primary: NewsColors.white),
      appBarTheme: const AppBarTheme(
        backgroundColor: NewsColors.black54,
      ),
      primaryColor: NewsColors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      ),
    );
  }
}
