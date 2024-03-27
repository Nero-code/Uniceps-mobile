import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Training/views/Screens/Exercise_page.dart';
import 'package:uniceps/features/Training/views/Screens/Measurements_and_profile_page.dart';
import 'package:uniceps/features/Training/views/Screens/Subs_page.dart';
import 'package:uniceps/features/Training/views/widgets/Week_days.dart';
import 'package:uniceps/features/Training/views/widgets/home_card.dart';
import 'package:uniceps/features/Training/views/widgets/training_group.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final DraggableScrollableController controller;

  @override
  void initState() {
    controller = DraggableScrollableController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = BlocProvider.of<LocaleCubit>(context).state.locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Uniceps"),
        actions: [
          IconButton(
            onPressed: () {
              // BlocProvider.of<LocaleCubit>(context)
              //     .changeLanguage(lang == 'en' ? 'ar' : 'en');
              Navigator.pushNamed(context, ROUTE_QR_SCANNER);
            },
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
                  MaterialPageRoute(
                      builder: (_) => MeasurementAndProfilePage()),
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
      body: Stack(
        children: [
          Column(
            children: [
              ///   H O M E   C A R D
              InkWell(
                onTap: () {
                  controller.animateTo(0.25,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
                child: HomeCard(),
              ),

              ///   W E E K   D A Y S
              InkWell(
                onTap: () => Navigator.pushNamed(context, ROUTE_PRESENCE),
                child: WeekDaysBanner(),
              ),
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
          DraggableScrollableSheet(
            initialChildSize: 0,
            controller: controller,
            minChildSize: 0.0,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                color: Colors.grey,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
