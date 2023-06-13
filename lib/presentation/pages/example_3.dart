import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/app_bar_action_button.dart';
import 'package:sliver_demo/presentation/widgets/custom_sliver_list.dart';

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  bool _isExpanded = true;
  final _expandedHeight = 240.0;
  late ScrollController _scrollController;

  @override
  initState() {
    super.initState();
    _scrollController = ScrollController()

      /// Adding listener to subscribe on notifications of [CustomScrollView]'s
      /// controller.
      ..addListener(_handleScrollNotification);
  }

  void _handleScrollNotification() {
    if (_scrollController.offset >= _expandedHeight - kToolbarHeight) {
      setState(() {
        _isExpanded = false;
      });
    } else {
      setState(() {
        _isExpanded = true;
      });
    }
  }

  /// Animate collapsing header.
  void _animateCollapsing() => _scrollController.animateTo(
        AppConstants.appBarExpandedHeight + kToolbarHeight,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );

  /// Collapse header after "back" gesture if header is expanded.
  Future<bool> _onWillPop() {
    if (_isExpanded) {
      _animateCollapsing();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: _expandedHeight,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  AppConstants.headerTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white.withOpacity(0.3),
                  ),
                ),
                background: Container(
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
              actions: _isExpanded
                  ? [
                      AppBarActionButton(
                        iconData: _isExpanded ? Icons.compress : Icons.expand,
                        onPressed: _animateCollapsing,
                      ),
                    ]
                  : null,
            ),
            const CustomSliverList(
              showHeader: false,
            ),
          ],
        ),
      ),
    );
  }
}
