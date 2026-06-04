import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/routine/blocs/items_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/blocs/sets_edit/sets_edit_bloc.dart';
import 'package:uniceps/app/presentation/routine/dialogs/item_description_add_edit_dialog.dart';
import 'package:uniceps/app/presentation/routine/widgets/set_widget.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class RoutineEditSetsScreen extends StatefulWidget {
  const RoutineEditSetsScreen({super.key, required this.itemId});

  final int itemId;

  @override
  State<RoutineEditSetsScreen> createState() => _RoutineEditSetsScreenState();
}

class _RoutineEditSetsScreenState extends State<RoutineEditSetsScreen> {
  final _formKey = GlobalKey<FormState>();
  List<RoutineSet> sets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocBuilder<ItemsEditBloc, ItemsEditState>(
        buildWhen: (_, current) => current is ItemsEditLoadedState,
        builder: (context, state) {
          var item = (state as ItemsEditLoadedState).items.firstWhere((i) => i.id == widget.itemId);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: screenSize.height * 0.3,
                // collapsedHeight: screenSize.height * 0.25,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    item.exercise.name,
                    textDirection: TextDirection.ltr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expandedTitleScale: 1.25,
                  centerTitle: true,
                  background: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 50),
                    child: Image.memory(item.exercise.imageBitMap!),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  BlocBuilder<SetsEditBloc, SetsEditState>(
                    buildWhen: (previous, current) => current is SetsEditLoadedState,
                    builder: (context, state) {
                      if (state is SetsEditLoadedState) {
                        sets.clear();
                        sets.addAll(state.sets);
                        // for (final s in state.sets) {
                        //   sets.addAll({s.id!: s.reps});
                        // }
                      }
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: screenSize.width,
                                child: InkWell(
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (_) => BlocProvider.value(
                                      value: context.read<ItemsEditBloc>(),
                                      child: ItemDescriptionAddEditDialog(
                                        dayId: item.dayId,
                                        itemId: item.id!,
                                        exerciseName: item.exercise.name,
                                        oldDescription: item.description,
                                        // onConfirm: (val) => setState(() => des = val),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(item.description ?? '${locale.addExerciseDescription}...'),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                BlocBuilder<SetsEditBloc, SetsEditState>(
                                  builder: (context, state) {
                                    return IconButton(
                                      onPressed: state is SetsEditLoadingState
                                          ? null
                                          : () => context.read<SetsEditBloc>().add(AddSetEvent(itemId: item.id!)),
                                      icon: state is SetsEditLoadingState
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                strokeCap: StrokeCap.round,
                                                color: Colors.teal,
                                                strokeWidth: 1.5,
                                              ),
                                            )
                                          : const Icon(Icons.add),
                                    );
                                  },
                                ),
                                Text(locale.setsAndRounds),
                                IconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        context.read<SetsEditBloc>().add(SaveSetsEvent(sets: sets));
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.done),
                                ),
                              ],
                            ),

                            if (state is SetsEditLoadedState)
                              Column(
                                children: [
                                  for (int i = 0; i < state.sets.length; i++)
                                    SetWidget(
                                      set: state.sets[i],
                                      isLast: i == state.sets.length - 1,
                                      onSave: (reps) => sets[i] = sets[i].copyWith(reps: reps),
                                    ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
