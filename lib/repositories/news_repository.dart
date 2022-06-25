import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news.dart';

class NewsRepository {
  //7d599c4bc96047a1b10fce80c93dd502
  final String _apiKey = "3389dd9e95de424cb296c50e38436d5b";

  Future fetch({required String date}) async {
    Uri url = Uri.parse(
      "https://newsapi.org/v2/everything?"
      "q=ios&from=$date&to=$date&sortBy=publishedAt&apiKey=$_apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final resultJson = jsonDecode(response.body);

      return News.fromJson(resultJson);
    } else {
      final resultJson = jsonDecode(response.body) as Map<String, dynamic>;

      return throw Exception(resultJson.values.last);
    }
  }
}
