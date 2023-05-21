import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_colors.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';
import 'package:sliver_demo/presentation/utils/app_durations.dart';
import 'package:sliver_demo/presentation/widgets/sliver_button.dart';

class BarActions extends StatelessWidget {
  final bool isCollapsed;

  const BarActions({
    required this.isCollapsed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.small,
      margin: EdgeInsets.only(
        right: isCollapsed ? AppConstants.none : AppConstants.medium,
      ),
      child: Row(
        children: [
          SliverButton(
            backgroundColor: AppColors.translucentWhite,
            onTap: () {
              // Handle upload action.
            },
            child: const Icon(Icons.file_upload_outlined),
          ),
          SliverButton(
            backgroundColor: AppColors.translucentWhite,
            onTap: () {
              // Handle more action.
            },
            child: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
