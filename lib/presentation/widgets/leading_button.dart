import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_colors.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';
import 'package:sliver_demo/presentation/utils/app_durations.dart';
import 'package:sliver_demo/presentation/widgets/sliver_button.dart';

class LeadingAction extends StatelessWidget {
  final bool isCollapsed;

  const LeadingAction({
    required this.isCollapsed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.small,
      margin: EdgeInsets.only(
        left: isCollapsed ? AppConstants.medium : AppConstants.large,
      ),
      child: Row(
        children: [
          SliverButton(
            backgroundColor: AppColors.translucentWhite,
            onTap: () {
              // Handle back action here.
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ],
      ),
    );
  }
}
