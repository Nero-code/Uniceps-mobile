import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/home/blocs/current_routine/current_routine_cubit.dart';
import 'package:uniceps/app/presentation/home/blocs/session/session_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/routine_management_screen.dart';

class PlayWidget extends StatelessWidget {
  const PlayWidget({
    super.key,
    required this.hasOldSession,
    this.onClose,
    required this.onStart,
  });
  final bool hasOldSession;
  final void Function()? onClose, onStart;
  final borderRadius = 10.0;
  final kBoxLength = 0.15;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenSize.width * kBoxLength,
          height: screenSize.width * kBoxLength,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),

            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: hasOldSession ? Colors.amber : Colors.green, width: .5),

            // gradient: LinearGradient(
            //   colors: hasOldSession
            //       ? [Colors.lime, Colors.amber]
            //       : [Colors.cyan, Colors.green],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            // boxShadow: [
            //   BoxShadow(
            //     offset: const Offset(0, 2),
            //     color: Colors.grey.shade300,
            //     blurRadius: 2,
            //     spreadRadius: 1,
            //   ),
            // ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius),
              // splashColor: Colors.black38,
              // highlightColor: Colors.black38,
              splashColor: Colors.amber.shade300,
              highlightColor: Colors.amber.shade300,
              onTap: onStart,
              child: SizedBox.expand(
                child: Icon(
                  hasOldSession ? Icons.rocket_launch : Icons.rocket,
                  size: 40,
                  // color: Colors.white,
                  color: hasOldSession ? Colors.amber : Colors.green,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: screenSize.width * kBoxLength,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),

              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: const Color.fromARGB(255, 120, 203, 214), width: .5),

              // color: const Color.fromARGB(255, 120, 203, 214),
              // boxShadow: [
              //   BoxShadow(
              //     offset: const Offset(0, 2),
              //     color: Colors.grey.shade300,
              //     blurRadius: 2,
              //     spreadRadius: 1,
              //   )
              // ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                splashColor: Colors.black38,
                highlightColor: Colors.black38,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                value: context.read<CurrentRoutineCubit>(),
                              ),
                              BlocProvider.value(
                                value: context.read<SessionBloc>(),
                              ),
                            ],
                            child: const RoutineManagementScreen(),
                          )));
                },
                child: SizedBox.expand(
                  child: Center(
                    child: BlocBuilder<CurrentRoutineCubit, CurrentRoutineState>(
                      builder: (context, state) {
                        return Text(
                          state.maybeWhen(orElse: () => "Current Routine Here", loaded: (routine, _) => routine.name),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            // color: Colors.white,
                            color: Color.fromARGB(255, 120, 203, 214),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (hasOldSession) ...[
          const SizedBox(width: 10),
          Container(
            width: screenSize.width * kBoxLength,
            height: screenSize.width * kBoxLength,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),

              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: Colors.red, width: .5),

              // gradient: LinearGradient(
              //   colors: [Colors.red.shade300, Colors.red],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),
              // boxShadow: [
              //   BoxShadow(
              //     offset: const Offset(0, 2),
              //     color: Colors.grey.shade300,
              //     blurRadius: 2,
              //     spreadRadius: 1,
              //   ),
              // ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                // splashColor: Colors.black38,
                // highlightColor: Colors.black38,
                splashColor: Colors.red.shade200,
                highlightColor: Colors.red.shade200,
                onTap: onClose,
                child: const SizedBox.expand(
                  child: Icon(
                    Icons.close,
                    size: 40,
                    // color: Colors.white,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
