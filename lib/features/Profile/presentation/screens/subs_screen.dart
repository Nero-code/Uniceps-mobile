import 'package:flutter/material.dart';

class SubScriptionScreen extends StatefulWidget {
  const SubScriptionScreen({super.key});

  @override
  State<SubScriptionScreen> createState() => _SubScriptionScreenState();
}

class _SubScriptionScreenState extends State<SubScriptionScreen> {
  final List<bool> items = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uniceps"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isOpen) {
            setState(() {
              for (int i = 0; i < items.length; i++) {
                if (i != index) {
                  items[i] = false;
                } else {
                  items[i] = !items[i];
                }
              }
            });
          },
          children: [
            for (int i = 0; i < items.length; i++)
              ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (context, isOpen) {
                  return SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Subscription $i\nSport: Yoga"),
                    ),
                  );
                },
                isExpanded: items[i],
                body: Column(
                  children: [
                    Divider(),
                    Text("Value"),
                    Text("Description: "),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
