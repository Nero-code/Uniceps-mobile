import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/sets_edit_bloc.dart';
import 'package:uniceps/app/presentation/screens/loading_page.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_item_horizontal_widget.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class RoutineItemEditTab extends StatefulWidget {
  const RoutineItemEditTab(
      {super.key, required this.dayId, required this.onItemTap});

  final int dayId;
  final void Function(int itemId) onItemTap;

  @override
  State<RoutineItemEditTab> createState() => _RoutineItemEditTabState();
}

class _RoutineItemEditTabState extends State<RoutineItemEditTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final screenSize = MediaQuery.sizeOf(context);
    // print("items length: ${items.length}");
    return BlocBuilder<ItemsEditBloc, ItemsEditState>(
      builder: (bcontext, state) {
        // print("builder ${state.runtimeType}");
        if (state is ItemsEditInitial) {
          BlocProvider.of<ItemsEditBloc>(context)
              .add(GetRoutineDayItemsEvent(dayId: widget.dayId));
        }
        if (state is ItemsEditLoadedState) {
          final items = state.items
              .where((element) => element.dayId == widget.dayId)
              .toList();

          items.sort((a, b) => a.index.compareTo(b.index));

          if (items.isNotEmpty) {
            return ReorderableListView(
              buildDefaultDragHandles: true,
              onReorder: (oldIndex, newIndex) {
                final list = items;
                final item = list.removeAt(oldIndex);

                list.insert(newIndex - (newIndex > oldIndex ? 1 : 0), item);

                BlocProvider.of<ItemsEditBloc>(context).add(
                    ReorderRoutineItemsEvent(
                        dayId: widget.dayId,
                        newOrder: list,
                        version: state.version));
              },
              children: [
                //
                // R O U T I N E   I T E M
                //
                ...items.map((item) => RoutineItemHorizontalWidget(
                    key: ValueKey(item.id!),
                    item: item,
                    onTap: widget.onItemTap)),
                // ...items.map((item) => RoutineItemVerticalWidget(item: item)),
                //

                //
                // P L A C E H O L D E R
                //

                // RoutineItemAddPlacholder(onAdd: (list) {
                //   items.addAll(
                //     list.map(
                //       (ex) => RoutineItem(
                //           id: null,
                //           apiId: null,
                //           dayId: widget.dayId,
                //           version: 0,
                //           exercise: ex,
                //           sets: [],
                //           isSynced: false),
                //     ),
                //   );
                //   print(list.length);
                //   setState(() {});
                // }),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    image: const AssetImage(IMG_BLANK),
                  ),
                  const SizedBox(height: 10),
                  const Text("no items, try the (+) button"),
                ],
              ),
            );
          }
        } else if (state is ItemsEditErrorState) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(state.failure.getErrorMessage()),
          ));
        }
        return const LoadingPage();

        // if (items.isNotEmpty) {
        //   return ReorderableListView(
        //     buildDefaultDragHandles: true,
        //     onReorder: (oldIndex, newIndex) {
        //       final list = items;
        //       final item = list.removeAt(oldIndex);

        //       list.insert(newIndex - (newIndex > oldIndex ? 1 : 0), item);

        //       BlocProvider.of<ItemsEditBloc>(context).add(
        //           ReorderRoutineItemsEvent(
        //               dayId: widget.dayId, newOrder: list,version: state));
        //     },
        //     children: [
        //       //
        //       // R O U T I N E   I T E M
        //       //
        //       ...items.map((item) => RoutineItemHorizontalWidget(
        //           key: ValueKey(item.id!),
        //           item: item,
        //           onTap: widget.onItemTap)),
        //       // ...items.map((item) => RoutineItemVerticalWidget(item: item)),
        //       //

        //       //
        //       // P L A C E H O L D E R
        //       //

        //       // RoutineItemAddPlacholder(onAdd: (list) {
        //       //   items.addAll(
        //       //     list.map(
        //       //       (ex) => RoutineItem(
        //       //           id: null,
        //       //           apiId: null,
        //       //           dayId: widget.dayId,
        //       //           version: 0,
        //       //           exercise: ex,
        //       //           sets: [],
        //       //           isSynced: false),
        //       //     ),
        //       //   );
        //       //   print(list.length);
        //       //   setState(() {});
        //       // }),
        //     ],
        //   );
        // } else {
        //   return Center(
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Image(
        //           width: MediaQuery.sizeOf(context).width * 0.5,
        //           image: const AssetImage(IMG_BLANK),
        //         ),
        //         const SizedBox(height: 10),
        //         const Text("no items, try the (+) button"),
        //       ],
        //     ),
        //   );
        // }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
