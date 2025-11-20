import 'package:flutter/material.dart';

class PerspectiveList extends StatefulWidget {
  const PerspectiveList({super.key});

  @override
  State<PerspectiveList> createState() => _PerspectiveListState();
}

class _PerspectiveListState extends State<PerspectiveList> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _controller,
        itemCount: 20,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Current scroll offset
              double offset = _controller.hasClients ? _controller.offset : 0.0;
              // Position of this item
              double itemOffset = index * 150.0 - offset;
              // Scale based on distance from center
              double scale = 1 - (itemOffset.abs() / 1000);
              scale = scale.clamp(0.8, 1.0);

              return Transform.scale(
                scale: scale,
                child: Opacity(
                  opacity: scale,
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        "Item $index",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
