// import 'package:cached_network_image/cached_network_image.dart';
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
        materialGapSize: 5,
        elevation: 0,
        expansionCallback: (panelIndex, isExp) {
          if (isExpanded.contains(panelIndex)) {
            isExpanded.remove(panelIndex);
          } else {
            isExpanded.add(panelIndex);
          }
          setState(() {});
        },
        children: [
          for (var i in widget.gyms)
            ExpansionPanel(
              canTapOnHeader: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              // backgroundColor: Colors.white,
              isExpanded: isExpanded.contains(widget.gyms.indexOf(i)),
              headerBuilder: (context, isExp) {
                return Row(
                  children: [
                    const SizedBox(width: 10),
                    // i.logo == null
                    //     ?
                    const Image(
                      image: AssetImage("images/logo/Logo.png"),
                      width: 30,
                      height: 30,
                    ),
                    // : CachedNetworkImage(
                    //     imageUrl: "${i.logo}",
                    //     width: 30,
                    //     height: 30,
                    //     placeholder: (context, url) {
                    //       return const Icon(Icons.fitness_center_outlined);
                    //     },
                    //   ),
                    SizedBox(width: 15),
                    Text(
                      i.name,
                      style: i.isCurrent
                          ? TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
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
                          arguments: i.gymId,
                        );
                      },
                      child: Text("Measurements")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ROUTE_SUBSCRIPTIONS,
                          arguments: i.gymId,
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
