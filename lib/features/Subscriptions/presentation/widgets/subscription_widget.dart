import 'package:flutter/material.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({super.key});

  final List<int> items = const [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: [
        for (var i in items)
          ExpansionPanel(
            headerBuilder: (context, isOpen) {
              return SizedBox(
                width: double.infinity,
                height: 50,
                child: Text("Title $i"),
              );
            },
            body: Text(
                "ASDASDASdasdasdasdasdasdasdassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"),
          ),
      ],
    );
  }
}
