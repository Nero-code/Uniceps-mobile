import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/routine/blocs/sets_edit/sets_edit_bloc.dart';

class SetWidget extends StatefulWidget {
  const SetWidget({
    super.key,
    required this.set,
    this.isLast = false,
  });

  final RoutineSet set;
  final bool isLast;

  @override
  State<SetWidget> createState() => _SetWidgetState();
}

class _SetWidgetState extends State<SetWidget> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  bool hasChanged = false;
  @override
  void initState() {
    _controller.text = widget.set.reps.toString();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
    super.initState();
  }

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
                  "${widget.set.index + 1}",
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
                  width: 80,
                  child: TextField(
                    focusNode: _focusNode,
                    textInputAction: TextInputAction.next,
                    onTap: () {
                      if (!_focusNode.hasFocus) {
                        _controller.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: _controller.text.length);
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: const TextInputType.numberWithOptions(),
                    style: const TextStyle(fontSize: 14),
                    controller: _controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      error: hasChanged ? const SizedBox() : null,
                      // errorText: hasChanged ? "" : null,
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber)),
                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amber, width: 2.0)),
                      // isCollapsed: true,
                      contentPadding: const EdgeInsets.all(8.0),
                      hintText: "--",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      border: const OutlineInputBorder(),
                      // prefixIcon: Icon(Icons.numbers, size: 15),
                    ),
                    maxLength: 4,
                    maxLines: 1,
                    buildCounter: (context,
                            {required currentLength,
                            required isFocused,
                            required maxLength}) =>
                        const SizedBox(),
                    onChanged: (value) => setState(() {
                      hasChanged = true;
                    }),
                    onSubmitted: (val) {
                      BlocProvider.of<SetsEditBloc>(context).add(UpdateSetEvent(
                          set: widget.set
                              .copyWith(reps: int.parse(_controller.text))));
                      setState(() {
                        hasChanged = false;
                      });
                      if (!widget.isLast) {
                        _focusNode.nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SetsEditBloc, SetsEditState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: state is SetsEditLoadingState
                          ? null
                          : () {
                              context
                                  .read<SetsEditBloc>()
                                  .add(RemoveSetEvent(set: widget.set));
                            },
                      icon: const Icon(Icons.close));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
