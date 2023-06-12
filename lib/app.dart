import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/pages/example_5.dart';
// import 'package:sliver_demo/presentation/pages/example_1.dart';
// import 'package:sliver_demo/presentation/pages/example_2.dart';
// import 'package:sliver_demo/presentation/pages/example_3.dart';
// import 'package:sliver_demo/presentation/pages/example_4.dart';
// import 'package:sliver_demo/presentation/pages/example_5.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example5(),
    );
  }
}
