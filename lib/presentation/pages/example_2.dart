import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/widgets/custom_sliver_list.dart';

import '../app_constants.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Color.fromRGBO(242, 173, 55, 1),
            title: Text(AppConstants.headerTitle),
          ),
          CustomSliverList(
            showHeader: false,
          ),
        ],
      ),
    );
  }
}
