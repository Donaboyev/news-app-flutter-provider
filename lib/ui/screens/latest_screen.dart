import 'package:flutter/material.dart';

class LatestPage extends StatelessWidget {
  const LatestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Latest page'),
      ),
    );
  }
}
