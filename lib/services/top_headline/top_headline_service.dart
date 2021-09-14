import 'package:kunuz_clone/bloc/models/main_response.dart';

abstract class TopHeadlinesService {
  Future<dynamic>? getTopHeadlines(int page);
}
