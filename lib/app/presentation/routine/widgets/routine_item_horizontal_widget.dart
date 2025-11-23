import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/sets_edit/sets_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/screens/routine_edit_sets_screen.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/box_botton.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoutineItemHorizontalWidget extends StatefulWidget {
  const RoutineItemHorizontalWidget({super.key, required this.item, required this.copyToAll});

  final RoutineItem item;
  final void Function(int itemId) copyToAll;
  @override
  State<RoutineItemHorizontalWidget> createState() => _RoutineItemHorizontalWidgetState();
}

class _RoutineItemHorizontalWidgetState extends State<RoutineItemHorizontalWidget> {
  final List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    final rtl = context.read<LocaleCubit>().state.isRtl();
    final group = widget.item.exercise.muscleGroupTranslations[rtl ? Lang.ar : Lang.en];

    return BlocProvider(
      create: (context) => SetsEditBloc(commands: di.sl())..add(GetSetsforRoutineItemEvent(itemId: widget.item.id!)),
      child: Builder(builder: (context) {
        return Stack(
          children: [
            Material(
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => BlocProvider.value(
                              value: context.read<SetsEditBloc>(),
                              child: RoutineEditSetsScreen(item: widget.item),
                            )),
                  );
                  setState(() {});
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
                  ),
                  // l=0 , h=100
                  // l=1 , h=150
                  // height: isExpanded ? (sets.length + 1) * 50 + 100 : 100,
                  margin: const EdgeInsets.all(8.0),
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
                            Text(locale.muscleGroup(group ?? '')),
                            const SizedBox(height: 20),
                            BlocBuilder<SetsEditBloc, SetsEditState>(
                              builder: (context, state) {
                                if (state is SetsEditLoadedState) {
                                  return state.sets.isNotEmpty
                                      ? Text(
                                          state.sets.map((s) => "${s.reps}").join(" x "),
                                          textDirection: TextDirection.ltr,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        )
                                      : const Icon(
                                          Icons.question_mark_outlined,
                                          color: Colors.grey,
                                        );
                                } else if (state is SetsEditErrorState) {
                                  return Text(state.failure.getErrorMessage());
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
                            SizedBox(height: 5.0),
                            BoxButton(
                              // background: Colors.blueGrey.shade50,
                              background: Colors.transparent,
                              borderRadius: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                              onTap: () => widget.copyToAll(widget.item.id!),
                              child: Text(locale.applyToAll,
                                  style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.primary)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -15.0,
              left: rtl ? -10.0 : null,
              right: rtl ? null : -10.0,
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => BlocProvider.value(
                            value: context.read<ItemsEditBloc>(),
                            child: AlertDialog(
                              title: Text(locale.delete),
                              icon: Icon(Icons.delete, size: 50, color: Colors.red.shade300),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("  ${locale.cancel}  "),
                                    ),
                                    SizedBox(width: 5.0),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(Colors.red.shade300),
                                        foregroundColor: const WidgetStatePropertyAll(Colors.white),
                                      ),
                                      onPressed: () {
                                        context
                                            .read<ItemsEditBloc>()
                                            .add(RemoveRoutineItemEvent(exercise: widget.item));
                                        Navigator.pop(context);
                                      },
                                      child: Text(locale.ok),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                },
                icon: const Icon(Icons.close),
                color: Colors.red.shade300,
              ),
            ),
          ],
        );
      }),
    );
  }
}
