import 'package:flutter/material.dart';
import 'package:kunuz_clone/bloc/providers/bottom_navigation_bar_provider.dart';
import 'package:kunuz_clone/ui/screens/main/articles_screen.dart';
import 'package:kunuz_clone/ui/screens/main/home_screen.dart';
import 'package:kunuz_clone/ui/screens/main/latest_screen.dart';
import 'package:kunuz_clone/ui/screens/main/media_screen.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: [
        HomePage(),
        LatestPage(),
        ArticlesPage(),
        MediaPage(),
      ][provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.indigo, fontSize: 14),
        unselectedLabelStyle: TextStyle(color: Colors.blueGrey, fontSize: 14),
        type: BottomNavigationBarType.fixed,
        onTap: provider.setCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.now_wallpaper),
            label: 'Latest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Media',
          ),
        ],
      ),
    );
  }
}
