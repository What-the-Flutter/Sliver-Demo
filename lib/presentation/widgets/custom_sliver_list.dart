import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/ingredient.dart';

class CustomSliverList extends StatelessWidget {
  final bool showHeader;

  const CustomSliverList({
    this.showHeader = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        if (showHeader)
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 4,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const Text(
                  AppConstants.headerTitle,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        if (!showHeader)
          const SizedBox(
            height: 36,
          ),
        for (var i = 0; i < AppConstants.products.length; i++)
          Ingredient(
            imageUrl: AppConstants.images[i],
            productName: AppConstants.products[i],
            unit: AppConstants.units[i],
            isFirst: i == 0,
            isLast: i == AppConstants.products.length - 1,
          ),
      ],
    );
  }
}
