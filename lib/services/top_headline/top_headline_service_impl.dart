import 'dart:convert';

import 'package:kunuz_clone/bloc/models/main_response.dart';
import 'package:kunuz_clone/services/top_headline/top_headline_service.dart';
import 'package:kunuz_clone/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class TopHeadlinesServiceImpl implements TopHeadlinesService {
  final Map<String, String> _headers = {'Accept': 'application/json'};

  @override
  Future<dynamic>? getTopHeadlines(int page) async {
    final Map<String, dynamic> queries = {
      COUNTRY_QRY: 'us',
      API_KEY_QRY: API_KEY,
      PAGE_QRY: page.toString(),
    };
    try {
      final Uri uri = Uri.https(HOST, TOP_HEADLINES_PATH, queries);
      final result = await http.get(uri, headers: _headers);
      return _createArticlesFromRawMap(json.decode(result.body));
    } catch (e) {
      return '$e';
    }
  }

  List<Articles> _createArticlesFromRawMap(Map jsonObject) {
    final MainResponse response = MainResponse.fromJson(jsonObject);
    List<Articles> list = [];
    for (var article in response.articles ?? <Articles>[]) {
      list.add(Articles.fromJson(article));
    }
    return list;
  }
}
