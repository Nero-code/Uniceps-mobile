import 'package:flutter/material.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Profile/domain/entities/gym.dart';

class GymWidget extends StatefulWidget {
  const GymWidget({
    super.key,
    required this.gyms,
  });

  final List<Gym> gyms;

  @override
  State<GymWidget> createState() => _GymWidgetState();
}

class _GymWidgetState extends State<GymWidget> {
  final isExpanded = <int>[];
  final list = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExp) {
          if (isExpanded.contains(panelIndex)) {
            isExpanded.remove(panelIndex);
          } else {
            isExpanded.add(panelIndex);
          }
          setState(() {});
        },
        children: [
          for (var i in list)
            ExpansionPanel(
              canTapOnHeader: true,
              // backgroundColor: Theme.of(context).colorScheme.background,
              backgroundColor: Colors.white,
              isExpanded: isExpanded.contains(list.indexOf(i)),
              headerBuilder: (context, isExp) {
                return Row(
                  children: [
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage("images/google.png"),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Gym Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
              body: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ROUTE_MEASUREMENTS,
                          // arguments: widget.gyms[i]
                        );
                      },
                      child: Text("Measurements")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ROUTE_SUBSCRIPTIONS,
                          // arguments: widget.gyms[i]
                        );
                      },
                      child: Text("Subscriptions")),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
