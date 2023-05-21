import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_colors.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/image.dart';
import 'package:sliver_demo/presentation/widgets/sliver_button.dart';

class ImageFullscreen extends StatelessWidget {
  const ImageFullscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        const Positioned.fill(
          child: SliverImage(),
        ),
        Positioned(
          left: AppConstants.large,
          top: AppConstants.extraLarge,
          child: SliverButton(
            backgroundColor: AppColors.translucentWhite,
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ],
    );
  }
}
