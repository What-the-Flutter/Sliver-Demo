import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/pages/sliver_app_bar_example.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliverAppBarExample(),
    );
  }
}
