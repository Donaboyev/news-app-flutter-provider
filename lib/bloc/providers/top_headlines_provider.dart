import 'package:flutter/material.dart';
import 'package:kunuz_clone/bloc/models/main_response.dart';
import 'package:kunuz_clone/services/service_locator.dart';
import 'package:kunuz_clone/services/top_headline/top_headline_service.dart';

class TopHeadlinesProvider extends ChangeNotifier {
  final TopHeadlinesService _topHeadlinesService =
      serviceLocator<TopHeadlinesService>();

  List<Articles> _articles = <Articles>[];
  int _page = 1;

  Future<void> loadTopHeadlineArticles() async {
    final result = await _topHeadlinesService.getTopHeadlines(_page);
    if (result is List<Articles>) {
      _articles.addAll(result);
    } else
      print('======================> result: $result');
    notifyListeners();
  }

  List<Articles>? get articles => _articles;
}
