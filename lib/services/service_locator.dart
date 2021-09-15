import 'package:get_it/get_it.dart';
import 'package:kunuz_clone/bloc/providers/article_detail_provider.dart';
import 'package:kunuz_clone/bloc/providers/top_headlines_provider.dart';
import 'package:kunuz_clone/services/top_headline/top_headline_service.dart';
import 'package:kunuz_clone/services/top_headline/top_headline_service_impl.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  serviceLocator.registerLazySingleton<TopHeadlinesService>(
      () => TopHeadlinesServiceImpl());

  serviceLocator
      .registerFactory<TopHeadlinesProvider>(() => TopHeadlinesProvider());
  serviceLocator.registerLazySingleton<ArticleDetailProvider>(
      () => ArticleDetailProvider());
}
