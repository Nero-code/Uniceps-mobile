import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/box_botton.dart';

class PracticePanel extends StatelessWidget {
  const PracticePanel({
    super.key,
    required this.mainIcon,
    required this.onPractice,
    required this.onSettings,
    this.onAnalytics,
    this.onStreak,
  });
  final Widget mainIcon;
  final VoidCallback onPractice;
  final VoidCallback onSettings;
  final VoidCallback? onAnalytics;
  final VoidCallback? onStreak;

  // C O N S T A N T S ----------------

  final double smallBtnIcon = 30;
  final double smallBtnSize = 60;

  final double largeBtnIcon = 50;
  final double largeBtnSize = 140;

  final btnBackgroundColor = const Color.fromARGB(29, 96, 125, 139);

  final bool isSigned = false;

  // ----------------------------------

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // final locale = AppLocalizations.of(context)!;
    return Container(
      width: screenSize.width,
      height: screenSize.height * .30,
      margin: const EdgeInsets.only(top: 50),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: BlocBuilder<SessionBloc, SessionState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    SizedBox.square(
                      dimension: 140,
                      child: CircularProgressIndicator(
                        strokeCap: StrokeCap.round,
                        color: Theme.of(context).colorScheme.secondary,
                        strokeWidth: 5,
                        value: state.maybeWhen(
                          loaded: (session) => session.progress,
                          orElse: () => 0.0,
                        ),
                      ),
                    ),
                    BoxButton(
                      isCircle: true,
                      width: largeBtnSize,
                      height: largeBtnSize,
                      background: const Color.fromARGB(29, 154, 178, 190),
                      // background: const Color.fromARGB(255, 226, 237, 243),
                      border: Border.all(width: 0.5, color: Colors.grey),
                      onTap: onPractice,
                      child: mainIcon,
                    ),
                  ],
                );
              },
            ),
          ),
          Builder(builder: (context) {
            // final acc = context.watch<AccountCubit>();
            final mem = context.watch<MembershipBloc>();

            return Align(
              alignment: Alignment.lerp(Alignment.bottomLeft, Alignment.topCenter, .20)!,
              child: Badge(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                backgroundColor: Colors.amber,
                isLabelVisible: mem.state.maybeWhen(orElse: () => true, loaded: (_) => false),
                label: const Image(
                  image: AssetImage(IMG_PREMIUM),
                  color: Colors.white,
                  width: 15,
                  height: 15,
                ),
                child: BoxButton(
                  isCircle: true,
                  width: smallBtnSize,
                  height: smallBtnSize,
                  background: btnBackgroundColor,
                  onTap: mem.state.whenOrNull(loaded: (_) => onAnalytics) ?? onAnalytics, // TODO: Remove bypass...
                  child: Icon(
                    Icons.bar_chart_rounded,
                    size: smallBtnIcon,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }),
          Align(
            alignment: Alignment.lerp(Alignment.bottomRight, Alignment.topCenter, .20)!,
            child: BoxButton(
              isCircle: true,
              width: smallBtnSize,
              height: smallBtnSize,
              background: btnBackgroundColor,
              onTap: onSettings,
              child: Icon(
                Icons.settings,
                size: smallBtnIcon,
                // color: Colors.black54,
                color: Colors.blueGrey.shade700,
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.lerp(Alignment.topLeft, Alignment.topCenter, 0.2)!,
          //   child: BoxButton(
          //     isCircle: true,
          //     width: smallBtnSize,
          //     height: smallBtnSize,
          //     background: btnBackgroundColor,
          //     onTap: onStreak,
          //     child: const Center(
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Icon(
          //             Icons.local_fire_department,
          //             color: Colors.orange,
          //             size: 30,
          //           ),
          //           // Text(
          //           //   "115",
          //           //   style: TextStyle(fontSize: 9),
          //           // ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.lerp(Alignment.topRight, Alignment.topCenter, 0.2)!,
          //   child: const LevelIndicator(size: 55),
          // ),
        ],
      ),
    );
  }
}
