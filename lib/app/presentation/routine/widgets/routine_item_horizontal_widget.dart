import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/presentation/routine/blocs/sets_edit/sets_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/routine_edit_sets_screen.dart';
import 'package:uniceps/injection_dependency.dart' as di;
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineItemHorizontalWidget extends StatefulWidget {
  const RoutineItemHorizontalWidget({super.key, required this.item});

  final RoutineItem item;
  @override
  State<RoutineItemHorizontalWidget> createState() =>
      _RoutineItemHorizontalWidgetState();
}

class _RoutineItemHorizontalWidgetState
    extends State<RoutineItemHorizontalWidget> {
  final List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    // final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => SetsEditBloc(commands: di.sl())
        ..add(GetSetsforRoutineItemEvent(itemId: widget.item.id!)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(builder: (context) {
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => BlocProvider.value(
                    value: BlocProvider.of<SetsEditBloc>(context),
                    child: RoutineEditSetsScreen(item: widget.item),
                  ),
                ),
              );
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              // l=0 , h=100
              // l=1 , h=150
              // height: isExpanded ? (sets.length + 1) * 50 + 100 : 100,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const FlutterLogo(size: 100),
                  SizedBox(
                    width: screenSize.width * 0.3,
                    child: widget.item.exercise.imageBitMap != null
                        ? Image.memory(widget.item.exercise.imageBitMap!)
                        : null,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(widget.item.exercise.name, maxLines: 2),
                        const Text("Muscle Group: z"), // TODO: Translate
                        const SizedBox(height: 20),
                        BlocBuilder<SetsEditBloc, SetsEditState>(
                          builder: (context, state) {
                            if (state is SetsEditLoadedState) {
                              return state.sets.isNotEmpty
                                  ? Text(
                                      state.sets
                                          .map((s) => "${s.reps}")
                                          .join(" x "),
                                      textDirection: TextDirection.ltr,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  : const Icon(
                                      Icons.question_mark_outlined,
                                      color: Colors.grey,
                                    );
                            }
                            return const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.teal,
                                strokeCap: StrokeCap.round,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
