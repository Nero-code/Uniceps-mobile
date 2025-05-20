import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/blocs/routine_edit/sets_edit_bloc.dart';

class SetWidget extends StatefulWidget {
  const SetWidget({
    super.key,
    required this.index,
    required this.routineItemId,
    required this.set,
    required this.controller,
    required this.onRemove,
  });

  final RoutineSet set;
  final TextEditingController controller;
  final int index, routineItemId;
  final void Function() onRemove;

  @override
  State<SetWidget> createState() => _SetWidgetState();
}

class _SetWidgetState extends State<SetWidget> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.08,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "${widget.index + 1}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: SizedBox(
                  width: 60,
                  child: TextField(
                    focusNode: _focusNode,
                    onTap: () {
                      if (!_focusNode.hasFocus) {
                        widget.controller.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: widget.controller.text.length);
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: const TextInputType.numberWithOptions(),
                    style: const TextStyle(fontSize: 14),
                    controller: widget.controller,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: "--",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 4,
                    maxLines: 1,
                    buildCounter: (context,
                            {required currentLength,
                            required isFocused,
                            required maxLength}) =>
                        const SizedBox(),
                    onSubmitted: (val) {
                      BlocProvider.of<SetsEditBloc>(context).add(UpdateSetEvent(
                          itemId: widget.routineItemId,
                          set: widget.set.copyWith(
                              reps: int.parse(widget.controller.text))));
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                  onPressed: widget.onRemove, icon: const Icon(Icons.close)),
            ),
          ],
        ),
      ),
    );
  }
}
