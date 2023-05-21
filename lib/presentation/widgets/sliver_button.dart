import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';

class SliverButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final VoidCallback onTap;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const SliverButton({
    required this.child,
    required this.backgroundColor,
    required this.onTap,
    this.margin,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.only(right: AppConstants.medium),
      child: Material(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.circle),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppConstants.circle),
          ),
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppConstants.medium),
            child: child,
          ),
        ),
      ),
    );
  }
}
