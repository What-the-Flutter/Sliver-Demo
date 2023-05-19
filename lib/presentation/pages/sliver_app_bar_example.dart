import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/app_constants.dart';
import 'package:sliver_demo/presentation/pages/image_page.dart';
import 'package:sliver_demo/presentation/widgets/custiom_sliver_app_bar.dart';

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _isFlexibleSpaceVisible = true;
  bool _isNavigating = false;

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (!_isNavigating &&
          notification.metrics.pixels < -AppConstants.maxOffset) {
        _isNavigating = true;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ImagePage(),
          ),
        ).then((_) => _isNavigating = false);
      } else if (notification.metrics.pixels >=
          AppConstants.appBarExpandedHeight - kToolbarHeight) {
        setState(() {
          _isFlexibleSpaceVisible = false;
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
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            CustomSliverAppBar(
              expandedHeight: AppConstants.appBarExpandedHeight,
              isFlexibleSpaceVisible: _isFlexibleSpaceVisible,
            ),
            const _SliverList(),
          ],
        ),
      ),
    );
  }
}

class _SliverList extends StatelessWidget {
  const _SliverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            color: index.isOdd ? Colors.white : Colors.black12,
            height: 100.0,
            child: Center(
              child: Text('$index', textScaleFactor: 5),
            ),
          );
        },
        childCount: 20,
      ),
    );
  }
}
