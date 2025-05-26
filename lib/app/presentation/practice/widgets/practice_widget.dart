// import 'package:flutter/material.dart';
// import 'package:uniceps/app/presentation/practice/widgets/round_widget.dart';

// class PracticeWidget extends StatefulWidget {
//   const PracticeWidget({super.key, this.isExpanded = false});

//   final bool isExpanded;

//   @override
//   State<PracticeWidget> createState() => _PracticeWidgetState();
// }

// class _PracticeWidgetState extends State<PracticeWidget> {
//   bool isExpanded = false;
//   @override
//   void initState() {
//     super.initState();
//     isExpanded = widget.isExpanded;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final screenSize = MediaQuery.sizeOf(context);
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           for (var i in [0, 1, 2, 3])
//             RoundWidget(
//               index: i + 1,
//               reps: 20,
//               controller: null,
//               lastWeight: null,
//               onTap: () {},
//             ),
//         ],
//       ),
//     );
//   }
// }
