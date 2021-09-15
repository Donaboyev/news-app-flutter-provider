import 'package:flutter/material.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Media page'),
      ),
    );
  }
}
