import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_colors.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(left: AppConstants.large),
              child: Text(
                'Home redecor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.fontExtraLarge,
                ),
              ),
            );
          } else if (index == 1) {
            return Padding(
              padding: const EdgeInsets.all(AppConstants.large),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: AppConstants.medium),
                    child: Text('Allison Matthews'),
                  ),
                ],
              ),
            );
          }
          return Container(
            height: 140,
            margin: const EdgeInsets.only(
              left: AppConstants.large,
              right: AppConstants.large,
            ),
            padding: const EdgeInsets.all(AppConstants.large),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: _containerBorderRadius(index),
            ),
            child: const _DefaultShimmer(),
          );
        },
        childCount: 100,
      ),
    );
  }

  /// The first condition for first or last index.
  BorderRadius _containerBorderRadius(int index) => switch (index) {
        2 => const BorderRadius.only(
            topLeft: Radius.circular(AppConstants.large),
            topRight: Radius.circular(AppConstants.large),
          ),
        99 => const BorderRadius.only(
            bottomLeft: Radius.circular(AppConstants.large),
            bottomRight: Radius.circular(AppConstants.large),
          ),
        _ => const BorderRadius.all(Radius.circular(AppConstants.none)),
      };
}

/// Shimmer class, instead of this pass the card content class.
/// For showing only.
final class _DefaultShimmer extends StatelessWidget {
  const _DefaultShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: AppConstants.medium),
          height: AppConstants.shimmerImageSize,
          width: AppConstants.shimmerImageSize,
          decoration: const BoxDecoration(
            color: AppColors.listBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstants.large),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10, top: 5),
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.listBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(AppConstants.medium),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
