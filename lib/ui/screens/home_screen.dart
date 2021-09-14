import 'package:flutter/material.dart';
import 'package:kunuz_clone/bloc/providers/top_headlines_provider.dart';
import 'package:kunuz_clone/services/service_locator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopHeadlinesProvider provider = serviceLocator<TopHeadlinesProvider>();
    provider.loadTopHeadlineArticles();
    return ChangeNotifierProvider(
      create: (context) => provider,
      child: Consumer<TopHeadlinesProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text((provider.articles?[index].title) ?? ''),
              );
            },
            itemCount: provider.articles?.length,
          ),
        ),
      ),
    );
  }
}
