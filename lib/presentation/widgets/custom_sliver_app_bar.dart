import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_colors.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/bar_actions.dart';
import 'package:sliver_demo/presentation/widgets/bar_title.dart';
import 'package:sliver_demo/presentation/widgets/image.dart';
import 'package:sliver_demo/presentation/widgets/leading_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomSliverAppBar({
    required this.scrollOffset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isCollapsed = scrollOffset > 150;

    return SliverAppBar(
      expandedHeight: AppConstants.expandedHeight,
      pinned: true,
      stretch: true,
      leading: LeadingAction(isCollapsed: isCollapsed),
      leadingWidth: AppConstants.leadingWidth,
      centerTitle: true,
      title: BarTitle(isCollapsed: isCollapsed),
      actions: [
        BarActions(isCollapsed: isCollapsed),
      ],
      flexibleSpace: ColoredBox(
        color: AppColors.white,
        child: FlexibleSpaceBar(
          background: Stack(
            children: [
              const Positioned.fill(
                child: SliverImage(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: AppConstants.bubblePosition(scrollOffset),
                  ),
                  decoration: const BoxDecoration(
                    // This color must be equal with main list background color.
                    color: AppColors.listBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppConstants.large),
                      topLeft: Radius.circular(AppConstants.large),
                    ),
                  ),
                  height: AppConstants.extraLarge,
                  child: const Center(
                    child: Icon(Icons.remove),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
