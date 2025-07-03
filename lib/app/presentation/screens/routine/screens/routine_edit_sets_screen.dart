import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/screens/routine/blocs/sets_edit/sets_edit_bloc.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/set_widget.dart';

class RoutineEditSetsScreen extends StatefulWidget {
  const RoutineEditSetsScreen({super.key, required this.item});

  final RoutineItem item;

  @override
  State<RoutineEditSetsScreen> createState() => _RoutineEditSetsScreenState();
}

class _RoutineEditSetsScreenState extends State<RoutineEditSetsScreen> {
  late final List<RoutineSet> sets;
  final List<TextEditingController> controllers = [];
  final _focusScopeNode = FocusScopeNode();

  @override
  void initState() {
    super.initState();

    sets = widget.item.sets;
    for (var s in sets) {
      controllers.add(TextEditingController(text: s.reps.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: screenSize.height * 0.3,
            // collapsedHeight: screenSize.height * 0.25,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.item.exercise.name,
                textDirection: TextDirection.ltr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              expandedTitleScale: 1.25,
              centerTitle: true,
              background: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 50),
                child: Image.memory(
                  widget.item.exercise.imageBitMap!,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                BlocBuilder<SetsEditBloc, SetsEditState>(
                  buildWhen: (previous, current) {
                    return current is SetsEditLoadedState;
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        const Text("Sets & Rounds"),
                        if (state is SetsEditLoadedState)
                          FocusScope(
                            node: _focusScopeNode,
                            child: Column(
                              children: [
                                for (int i = 0; i < state.sets.length; i++)
                                  SetWidget(
                                      set: state.sets[i],
                                      isLast: i == state.sets.length - 1),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 50,
                          child: BlocBuilder<SetsEditBloc, SetsEditState>(
                            builder: (context, state) {
                              return OutlinedButton(
                                onPressed: state is SetsEditLoadingState
                                    ? null
                                    : () {
                                        context.read<SetsEditBloc>().add(
                                            AddSetEvent(
                                                itemId: widget.item.id!));
                                      },
                                child: state is SetsEditLoadingState
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
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
