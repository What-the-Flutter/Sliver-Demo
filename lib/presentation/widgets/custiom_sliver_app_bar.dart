import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/app_bar_action_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  final double expandedHeight;
  final bool isFlexibleSpaceVisible;

  const CustomSliverAppBar({
    required this.expandedHeight,
    required this.isFlexibleSpaceVisible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      stretchTriggerOffset: AppConstants.maxOffset,
      expandedHeight: expandedHeight,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: const _FlexibleSpaceBar(),
      leading: const AppBarActionButton(
        iconData: Icons.arrow_back_ios_new,
        padding: EdgeInsets.all(8),
      ),
      title: isFlexibleSpaceVisible
          ? const _FollowButton()
          : const Text(
              'Another title',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
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
                AppConstants.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  const _FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: RawMaterialButton(
        onPressed: () {},
        elevation: 0.0,
        fillColor: Colors.deepPurple[500],
        constraints: BoxConstraints.tight(const Size(80, 36)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Follow',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
