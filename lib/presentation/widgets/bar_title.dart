import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_colors.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';
import 'package:sliver_demo/presentation/utils/app_durations.dart';
import 'package:sliver_demo/presentation/widgets/sliver_button.dart';

class BarTitle extends StatelessWidget {
  final bool isCollapsed;

  const BarTitle({
    required this.isCollapsed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppDurations.extraSmall,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
          child: child,
        );
      },
      child: KeyedSubtree(
        key: ValueKey<bool>(isCollapsed),
        child: isCollapsed
            ? const Column(
                children: [
                  Text(
                    'Home redecor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppConstants.fontLarge,
                    ),
                  ),
                  Text(
                    'by Allison Matthews',
                    style: TextStyle(fontSize: AppConstants.fontNormal),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SliverButton(
                    backgroundColor: AppColors.followButtonColor,
                    onTap: () {
                      // Handle follow button.
                    },
                    padding: const EdgeInsets.fromLTRB(
                      AppConstants.large,
                      AppConstants.medium,
                      AppConstants.large,
                      AppConstants.medium,
                    ),
                    child: const Text(
                      'Follow',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
