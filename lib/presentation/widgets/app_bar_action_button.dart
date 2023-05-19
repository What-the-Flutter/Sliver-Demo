import 'package:flutter/material.dart';

class AppBarActionButton extends StatelessWidget {
  final IconData iconData;
  final EdgeInsets? padding;

  const AppBarActionButton({
    required this.iconData,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 8.0),
      child: RawMaterialButton(
        constraints: BoxConstraints.tight(const Size(36, 36)),
        onPressed: () {},
        elevation: 0,
        fillColor: Colors.white.withOpacity(0.8),
        shape: const CircleBorder(),
        child: Center(
          child: Icon(
            iconData,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
