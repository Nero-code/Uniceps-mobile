import 'package:flutter/material.dart';
import 'package:uniceps/app/presentation/practice/widgets/round_widget.dart';
import 'package:uniceps/core/constants/constants.dart';

class PracticeWidget extends StatelessWidget {
  const PracticeWidget({super.key, required this.isExpanded});

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return ExpansionPanelList(
      elevation: 0.0,
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: isExpanded,
          headerBuilder: (context, isExpanded) => Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Image(
                    image: const AssetImage(IMG_BACK),
                    width: screenSize.width * 0.3),
                Text("name name name"),
              ],
            ),
          ),
          body: Column(
            children: [
              for (var i in [0, 1, 2, 3])
                RoundWidget(index: i + 1, controller: null, lasWeight: null),
            ],
          ),
        ),
      ],
    );
  }
}
