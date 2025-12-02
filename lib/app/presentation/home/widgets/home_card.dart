// import 'package:flutter/material.dart';
// import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class HomeCard extends StatelessWidget {
//   const HomeCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // final local = AppLocalizations.of(context)!;

//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.25,
//       child: Stack(
//         children: [
//           //
//           //  H O M E   C A R D
//           //
//           Padding(
//             padding: const EdgeInsets.all(15),
//             child: Material(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               elevation: 10,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //
//                         //  Q R   A N D   S W I T C H   B T N s
//                         //
//                         Row(
//                           children: [
//                             Material(
//                               // elevation: 3,
//                               borderRadius: BorderRadius.circular(8),
//                               // color: Color.fromARGB(138, 41, 91, 121),
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .primary
//                                   .withAlpha(190),
//                               child: InkWell(
//                                 borderRadius: BorderRadius.circular(8),
//                                 onTap: () {},
//                                 child: const Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 5.0, vertical: 3.0),
//                                   child: Icon(
//                                     Icons.cached,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Material(
//                               // elevation: 3,
//                               borderRadius: BorderRadius.circular(8),
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .secondary
//                                   .withAlpha(100),
//                               child: InkWell(
//                                 borderRadius: BorderRadius.circular(8),
//                                 onTap: () {},
//                                 child: const Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 5.0, vertical: 3.0),
//                                   child: Icon(Icons.qr_code),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         //
//                         //  G Y M   I N F O   S E C T I O N
//                         //
//                       ],
//                     ),
//                     //
//                     //  L E V E L   I N D I C A T O R
//                     //
//                     Center(
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.height * 0.13,
//                         height: MediaQuery.of(context).size.height * 0.13,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GradientCircularProgressIndicator(
//                             progress: 0.5,
//                             backgroundColor: Colors.grey.shade200,
//                             gradient: LinearGradient(
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                               colors: [
//                                 Theme.of(context).colorScheme.secondary,
//                                 Theme.of(context).colorScheme.primary,
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   "lvl: ${5}",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 Text(
//                                   "${((0.5 * 100).round() - (0.5 * 100))}%",
//                                   style: const TextStyle(
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
