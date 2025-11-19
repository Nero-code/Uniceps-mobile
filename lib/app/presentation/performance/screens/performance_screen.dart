import 'package:flutter/material.dart';
import 'package:uniceps/core/widgets/loading_page.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(Duration.zero),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.warning_rounded),
                    Text("${snapshot.error}"),
                  ],
                ),
              );
            }
            return const LoadingIndicator();
          }),
    );
  }
}
