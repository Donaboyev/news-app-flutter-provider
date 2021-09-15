import 'package:flutter/material.dart';
import 'package:kunuz_clone/bloc/providers/article_detail_provider.dart';
import 'package:kunuz_clone/services/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? url = ModalRoute.of(context)!.settings.arguments as String;
    final ArticleDetailProvider provider =
        serviceLocator<ArticleDetailProvider>();
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<ArticleDetailProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  print('==========> refresh button clicked');
                  await provider.reloadPage();
                },
                icon: Icon(Icons.refresh),
              )
            ],
          ),
          body: WebView(
            initialUrl: url,
            onWebViewCreated: (controller) {
              provider.setWebViewController(controller);
            },
          ),
        ),
      ),
    );
  }
}
