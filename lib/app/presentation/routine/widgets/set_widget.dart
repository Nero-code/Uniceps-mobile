import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/routine_classes/routine_sets.dart';
import 'package:uniceps/app/presentation/routine/blocs/sets_edit/sets_edit_bloc.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class SetWidget extends StatefulWidget {
  const SetWidget({super.key, required this.set, this.isLast = false, required this.onSave});

  final RoutineSet set;
  final bool isLast;
  final void Function(int reps) onSave;

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
    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
    //   }
    // });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SetWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.text = "${widget.set.reps}";
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.08,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Expanded(
            //   child: Center(
            //     child: BoxButton(
            //       background: hasChanged ? Colors.grey.shade200 : const Color.fromARGB(136, 215, 237, 255),
            //       borderRadius: 10,
            //       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            //       onTap: hasChanged
            //           ? () {
            //               BlocProvider.of<SetsEditBloc>(
            //                 context,
            //               ).add(UpdateSetEvent(set: widget.set.copyWith(reps: int.parse(_controller.text))));
            //               setState(() {
            //                 hasChanged = false;
            //               });
            //             }
            //           : null,
            //       child: Icon(
            //         hasChanged ? Icons.done : Icons.done,
            //         color: hasChanged ? Colors.grey : Colors.blue,
            //         size: 20,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 2,
              child: Center(
                child: SizedBox(
                  width: 80,
                  child: TextFormField(
                    focusNode: _focusNode,
                    textInputAction: widget.isLast ? TextInputAction.done : TextInputAction.next,
                    onTap: () {
                      if (!_focusNode.hasFocus) {
                        _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
                      }
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: const TextInputType.numberWithOptions(),
                    style: const TextStyle(fontSize: 14),
                    controller: _controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      error: hasChanged ? const SizedBox() : null,
                      // errorText: hasChanged ? "" : null,
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amber),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.amber, width: 2.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // isCollapsed: true,
                      contentPadding: const EdgeInsets.all(8.0),
                      hintText: "--",
                      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      // prefixIcon: Icon(Icons.numbers, size: 15),
                    ),
                    maxLength: 4,
                    maxLines: 1,
                    buildCounter: (context, {required currentLength, required isFocused, required maxLength}) =>
                        const SizedBox(),
                    onChanged: (value) => setState(() {
                      hasChanged = true;
                    }),
                    validator: (value) => int.tryParse(value ?? '') == null ? l10n.setRepsError : null,
                    onSaved: (value) {
                      widget.onSave(int.parse(value!));
                      hasChanged = false;
                    },

                    selectAllOnFocus: true,
                    onFieldSubmitted: (val) {
                      // BlocProvider.of<SetsEditBloc>(context)
                      //     .add(UpdateSetEvent(set: widget.set.copyWith(reps: int.parse(_controller.text))));
                      // setState(() => hasChanged = false);

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
                            context.read<SetsEditBloc>().add(RemoveSetEvent(set: widget.set));
                          },
                    color: Colors.red.shade200,
                    icon: const Icon(Icons.close),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
