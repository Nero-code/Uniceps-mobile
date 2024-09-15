import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("yoyo"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => const SizedBox(),
                childCount: 2),
          ),
        ],
      ),
    );
  }
}
