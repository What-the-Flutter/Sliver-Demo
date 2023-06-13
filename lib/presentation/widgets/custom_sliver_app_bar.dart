import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/app_bar_action_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  final double expandedHeight;
  final bool isFlexibleSpaceVisible;
  final String anotherTitle;

  const CustomSliverAppBar({
    required this.expandedHeight,
    required this.isFlexibleSpaceVisible,
    required this.anotherTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: expandedHeight,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: const _FlexibleSpaceBar(),
      leading: const AppBarActionButton(
        iconData: Icons.arrow_back_ios_new,
        padding: EdgeInsets.all(8),
      ),
      title: !isFlexibleSpaceVisible
          ? Text(
              anotherTitle,
              style: const TextStyle(
                color: Colors.black,
              ),
            )
          : null,
      centerTitle: true,
      actions: const [
        AppBarActionButton(iconData: Icons.ios_share),
        AppBarActionButton(iconData: Icons.pending_outlined),
      ],
    );
  }
}

class _FlexibleSpaceBar extends StatelessWidget {
  const _FlexibleSpaceBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      stretchModes: const <StretchMode>[
        StretchMode.zoomBackground,
      ],
      background: Hero(
        tag: 'ImageTag',
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                AppConstants.imageUrlAppBar,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
