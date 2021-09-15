import 'package:flutter/material.dart';
import 'package:kunuz_clone/bloc/models/main_response.dart';
import 'package:kunuz_clone/bloc/providers/top_headlines_provider.dart';
import 'package:kunuz_clone/services/service_locator.dart';
import 'package:kunuz_clone/ui/screens/detail/article_detail_screen.dart';
import 'package:kunuz_clone/ui/widgets/home/top_headline_item_widget.dart';
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
        builder: (context, provider, child) => CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'Top news',
                style: TextStyle(fontFamily: 'Lato'),
              ),
              elevation: 0,
              centerTitle: true,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Articles? article = provider.articles?[index];
                  return TopHeadlineItemWidget(article: article);
                },
                childCount: provider.articles?.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
