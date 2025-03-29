import 'package:flutter/material.dart';

class ExercisesSelectionScreen extends StatelessWidget {
  const ExercisesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 20,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (int i = 0; i < 20; i++) Tab(text: "group $i"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (int i = 0; i < 20; i++) Text("$i"),
          ],
        ),
      ),
    );
  }
}
