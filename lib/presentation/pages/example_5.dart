import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/app_bar_action_button.dart';
import 'package:sliver_demo/presentation/widgets/custom_sliver_list.dart';

class Example5 extends StatefulWidget {
  const Example5({super.key});

  @override
  State<Example5> createState() => _Example5State();
}

class _Example5State extends State<Example5> {
  final _offsetHeight = 36.0;
  int _viewIngredients = 0;
  bool _isFlexibleSpaceVisible = true;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (notification.metrics.pixels >=
          AppConstants.appBarExpandedHeight - kToolbarHeight) {
        setState(() {
          _isFlexibleSpaceVisible = false;
          _viewIngredients = (notification.metrics.pixels -
                  AppConstants.appBarExpandedHeight +
                  kToolbarHeight -
                  _offsetHeight) ~/
              100;
        });
      } else {
        setState(() {
          _isFlexibleSpaceVisible = true;
        });
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              expandedHeight: AppConstants.appBarExpandedHeight,
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppConstants.headerTitle,
                        style: TextStyle(
                          color: _isFlexibleSpaceVisible
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    if (!_isFlexibleSpaceVisible)
                      Expanded(
                        child: Text(
                          'Viewed ingredients: $_viewIngredients',
                          style: const TextStyle(
                            color: Color(0xFF2F2D2D),
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
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
              leading: const AppBarActionButton(
                iconData: Icons.arrow_back_ios_new,
                padding: EdgeInsets.all(8),
              ),
              centerTitle: true,
              actions: _isFlexibleSpaceVisible
                  ? const [
                      AppBarActionButton(iconData: Icons.ios_share),
                      AppBarActionButton(iconData: Icons.pending_outlined),
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
