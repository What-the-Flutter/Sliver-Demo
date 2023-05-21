import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/pages/image_fullscreen.dart';
import 'package:sliver_demo/presentation/utils/app_colors.dart';
import 'package:sliver_demo/presentation/utils/app_constants.dart';
import 'package:sliver_demo/presentation/utils/physics.dart';
import 'package:sliver_demo/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:sliver_demo/presentation/widgets/custom_sliver_list.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  late final ScrollController _scrollController;

  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(
      () {
        setState(
          () {
            _scrollOffset = _scrollController.offset;
            if (_scrollOffset < AppConstants.offsetToExpand) _navigateTo();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        // Color for sliver list background.
        color: AppColors.listBackgroundColor,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const FasterBouncingScrollPhysics(),
          slivers: [
            CustomSliverAppBar(
              scrollOffset: _scrollOffset,
            ),
            const CustomSliverList(),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateTo() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ImageFullscreen(),
      ),
    );
  }
}
