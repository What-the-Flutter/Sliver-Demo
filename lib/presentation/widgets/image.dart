import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';

class SliverImage extends StatelessWidget {
  const SliverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero_tag',
      child: Image.network(
        AppConstants.url,
        fit: BoxFit.cover,
      ),
    );
  }
}