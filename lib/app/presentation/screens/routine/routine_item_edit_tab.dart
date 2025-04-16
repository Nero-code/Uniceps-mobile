import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_item.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/items_edit_bloc.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_item_add_placholder.dart';
import 'package:uniceps/app/presentation/screens/routine/widgets/routine_item_horizontal_widget.dart';
// import 'package:uniceps/app/presentation/screens/routine/widgets/routine_sets_sheet.dart';

class RoutineItemEditTab extends StatefulWidget {
  const RoutineItemEditTab(
      {super.key, required this.dayId, this.isExpanded = false});
  final int dayId;
  final bool isExpanded;

  @override
  State<RoutineItemEditTab> createState() => _RoutineItemEditTabState();
}

class _RoutineItemEditTabState extends State<RoutineItemEditTab>
    with AutomaticKeepAliveClientMixin {
  final List<RoutineItem> items = [];

  final panelController = PanelController();

  void saveAll() {
    BlocProvider.of<ItemsEditBloc>(context)
        .add(AddRoutineItemsEvent(exercises: items));
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final screenSize = MediaQuery.sizeOf(context);
    // print("items length: ${items.length}");
    return ListView(
      children: [
        //
        // R O U T I N E   I T E M
        //
        ...items.map(
            (item) => RoutineItemHorizontalWidget(item: item, onTap: () {})),
        // ...items.map((item) => RoutineItemVerticalWidget(item: item)),
        //

        //
        // P L A C E H O L D E R
        //
        RoutineItemAddPlacholder(onAdd: (list) {
          items.addAll(
            list.map(
              (ex) => RoutineItem(
                  id: null,
                  apiId: null,
                  dayId: widget.dayId,
                  version: 0,
                  exercise: ex,
                  sets: [],
                  isSynced: false),
            ),
          );
          print(list.length);
          setState(() {});
        }),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
