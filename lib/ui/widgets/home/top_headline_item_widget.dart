import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kunuz_clone/bloc/models/main_response.dart';
import 'package:kunuz_clone/ui/screens/detail/article_detail_screen.dart';
import 'package:kunuz_clone/utils/base_functions.dart';

class TopHeadlineItemWidget extends StatelessWidget {
  final Articles? article;

  const TopHeadlineItemWidget({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (article?.url != null)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ArticleDetailScreen(),
                      settings: RouteSettings(arguments: article?.url),
                    ),
                  );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article?.title ?? '',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontFamily: 'Lato',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            BaseFunctions.getPublishedTime(
                                  article?.publishedAt ?? '',
                                ) ??
                                '',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    CachedNetworkImage(
                      imageUrl: article?.urlToImage ?? '',
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          width: 120,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => Container(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
