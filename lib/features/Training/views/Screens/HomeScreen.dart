import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:uniceps/features/Training/views/Screens/Exercise_page.dart';
import 'package:uniceps/features/Training/views/Screens/Subs_page.dart';
import 'package:uniceps/features/Training/views/widgets/Week_days.dart';
import 'package:uniceps/features/Training/views/widgets/home_card.dart';
import 'package:uniceps/features/Training/views/widgets/subscription_widget.dart';
import 'package:uniceps/features/Training/views/widgets/training_group.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Uniceps"),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: "QR Scan",
            icon: const Icon(Icons.qr_code_scanner),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.fitness_center_rounded),
          // ),
          Material(
            color: Colors.transparent,
            child: SizedBox(
              width: 40,
              height: 40,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SubScriptionPage()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ///   H O M E   C A R D
          HomeCard(),

          ///   W E E K   D A Y S
          WeekDaysBanner(),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 50),
              children: [
                for (int i = 0; i < 14; i++)
                  i % 2 == 1
                      ? OpenContainer(
                          closedElevation: 0,
                          openElevation: 0,
                          transitionType: ContainerTransitionType.fade,
                          transitionDuration: Duration(milliseconds: 500),
                          closedBuilder: (context, _) => TrainingGroup(),
                          openBuilder: (context, _) => ExercisesPage(),
                        )
                      : const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
