import 'package:flutter/material.dart';
import 'package:sliver_demo/presentation/app_constants.dart';
import 'package:sliver_demo/presentation/widgets/app_bar_action_button.dart';
import 'package:sliver_demo/presentation/widgets/custom_sliver_list.dart';

class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: AppBarActionButton(
              iconData: Icons.arrow_back_ios_new,
              padding: EdgeInsets.all(8),
            ),
            centerTitle: true,
            actions: [
              AppBarActionButton(iconData: Icons.ios_share),
              AppBarActionButton(iconData: Icons.pending_outlined),
            ],
            title: Text(
              AppConstants.headerTitle,
              style: TextStyle(color: Colors.black),
            ),
          ),
          CustomSliverList(),
        ],
      ),
    );
  }
}
