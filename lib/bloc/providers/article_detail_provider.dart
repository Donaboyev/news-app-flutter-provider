import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailProvider extends ChangeNotifier {
  WebViewController? webViewController;

  Future<void> reloadPage() async {
    print('==================> reload page function');
    await webViewController?.reload();
    notifyListeners();
  }

  Future<void> setWebViewController(WebViewController controller) async {
    webViewController = controller;
    notifyListeners();
  }
}
