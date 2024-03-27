import 'package:flutter/material.dart';

class SubScriptionScreen extends StatefulWidget {
  const SubScriptionScreen({super.key});

  @override
  State<SubScriptionScreen> createState() => _SubScriptionPageState();
}

class _SubScriptionPageState extends State<SubScriptionScreen> {
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
                if (i != index)
                  items[i] = false;
                else {
                  items[i] = !items[i];
                }
              }
            });
          },
          children: [
            for (int i = 0; i < items.length; i++)
              ExpansionPanel(
                headerBuilder: (context, isOpen) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    child: Text("Subscription $i \n Sport: Yoga"),
                  );
                },
                isExpanded: items[i],
                body: Container(
                  color: Colors.amber,
                  child: Center(
                      child: Text("asdasdasdasdasdasd \nasdasdasdasdasdasd")),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
