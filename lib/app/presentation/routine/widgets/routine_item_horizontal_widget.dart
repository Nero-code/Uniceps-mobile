import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/sets_edit/sets_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/routine_edit_sets_screen.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final locale = AppLocalizations.of(context)!;
    final rtl = context.read<LocaleCubit>().state.isRtl();
    final group =
        widget.item.exercise.muscleGroupTranslations[rtl ? Lang.ar : Lang.en];
    return BlocProvider(
      create: (context) => SetsEditBloc(commands: di.sl())
        ..add(GetSetsforRoutineItemEvent(itemId: widget.item.id!)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Builder(builder: (context) {
          return Stack(
            children: [
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => BlocProvider.value(
                              value: BlocProvider.of<SetsEditBloc>(context),
                              child: RoutineEditSetsScreen(item: widget.item),
                            )),
                  ),
                  child: Material(
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
                                ? Image.memory(
                                    widget.item.exercise.imageBitMap!)
                                : null,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(widget.item.exercise.name, maxLines: 2),
                                Text(locale.muscleGroup(group ?? '')),
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
                                    } else if (state is SetsEditErrorState) {
                                      return Text(
                                          state.failure.getErrorMessage());
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
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                right: rtl ? 0.0 : null,
                left: rtl ? null : 0.0,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => BlocProvider.value(
                              value: context.read<ItemsEditBloc>(),
                              child: AlertDialog(
                                title: Text(locale.delete),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(locale.cancel),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Colors.red.shade300),
                                      foregroundColor:
                                          const WidgetStatePropertyAll(
                                              Colors.white),
                                    ),
                                    onPressed: () {
                                      context.read<ItemsEditBloc>().add(
                                          RemoveRoutineItemEvent(
                                              exercise: widget.item));
                                      Navigator.pop(context);
                                    },
                                    child: Text(locale.ok),
                                  ),
                                ],
                              ),
                            ));
                    // context
                    //     .read<ItemsEditBloc>()
                    //     .add(RemoveRoutineItemEvent(exercise: widget.item));
                  },
                  icon: Icon(Icons.close),
                  color: Colors.red,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
