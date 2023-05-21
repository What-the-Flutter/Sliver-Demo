import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/pages/sliver_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.grey,
        primarySwatch: Colors.grey,
      ),
      home: const SliverPage(),
    );
  }
}