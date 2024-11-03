import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/features/Profile/domain/classes/subscription.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/main_cubit/locale_cubit.dart';

final f = intl.NumberFormat("###,###,###");

class SubsrciptionWidget extends StatefulWidget {
  const SubsrciptionWidget({super.key, required this.sub});

  final Subscription sub;

  @override
  State<SubsrciptionWidget> createState() => _SubsrciptionWidgetState();
}

class _SubsrciptionWidgetState extends State<SubsrciptionWidget> {
  bool _showFrontSide = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final isRtl = context.read<LocaleCubit>().state.isRtl();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.3,
      child: InkWell(
        onTap: isLoading ? null : _switchCard,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: _transitionBuilder,
          layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInBack.flipped,
          child: _showFrontSide ? _buildFront(local, isRtl) : _buildRear(),
        ),
      ),
    );
  }

  void _switchCard() {
    if (isLoading) {
      return;
    }
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFront(AppLocalizations local, bool rtl) {
    // print(widget.sub.price);
    // print(widget.sub.paidValue);
    // print(widget.sub.discountVal);
    final isRtl = rtl;
    return Stack(
      key: const ValueKey(true),
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //   color: Colors.grey.shade300,
              // ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 20.0),
                  color: Colors.grey.shade300,
                  blurRadius: 15.0,
                  spreadRadius: 7.0,
                ).scale(0.1),
              ]),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${local.sport}: ${widget.sub.sportName}",
                      ),
                      const SizedBox(height: 5.0),
                      Text("${local.trainer}: ${widget.sub.trainerName}"),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          //
                          //  P R I C E
                          //
                          Text(
                            "${local.price}: ${f.format(widget.sub.price - widget.sub.discountVal)}",
                          ),
                          const SizedBox(width: 10.0),
                          if (widget.sub.discountVal != 0.0)

                            //
                            //  D I S C O U N T
                            //
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    width: 0.5,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                              child: Text(
                                "${local.discount}: "
                                "${f.format(widget.sub.discountVal)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 7.5,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                        ],
                      ),
                      //
                      //  R E M A I N  I N G
                      //
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          //
                          //  I S   P A I D
                          //
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 0.5,
                                  color: widget.sub.isPaid
                                      ? Colors.green
                                      : Colors.red,
                                )),
                            child: Text(
                              widget.sub.isPaid ? local.paid : local.notPaid,
                              style: TextStyle(
                                color: widget.sub.isPaid
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 7.5,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          if (!widget.sub.isPaid)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                  // color:
                                  //     Theme.of(context).colorScheme.secondary,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    width: 0.5,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                              child: Text(
                                "${local.remaining}: "
                                "${f.format(widget.sub.price - widget.sub.paidValue - widget.sub.discountVal)}",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 7.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5.0),

                      //
                      //  E N D - D A T E
                      //
                      Text(
                        "${local.endOfSubDate}: ",
                      ),
                      Text(
                        "${widget.sub.endDate.day}/${widget.sub.endDate.month}/${widget.sub.endDate.year}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                //
                //  L I N E A R   P R O G R E S S
                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${range(widget.sub.startDate, widget.sub.endDate)} ",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        Text(
                          local.days,
                          style: TextStyle(
                              fontSize: 10,
                              // fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                    LinearProgressIndicator(
                      minHeight: 5,
                      borderRadius: BorderRadius.circular(15),
                      value: percent(widget.sub.startDate, widget.sub.endDate),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: isRtl ? 10.0 : null,
          right: isRtl ? null : 10.0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: range(widget.sub.startDate, widget.sub.endDate) > 0
                  ? Colors.green.shade300
                  : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRear() {
    // widget.sub.payments?.forEach((e) => print(e.toJson()));
    double size = 14.0;
    if (widget.sub.payments != null && widget.sub.payments!.isNotEmpty) {
      switch (widget.sub.payments!.length) {
        case 1:
          size = 20.0;
          break;
        case 2:
          size = 17.0;
          break;
        default:
          size = 14.0;
      }
    }
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      key: const ValueKey(false),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 20.0),
              color: Colors.grey.shade300,
              blurRadius: 15.0,
              spreadRadius: 7.0,
            ).scale(0.1),
          ]),
      child: widget.sub.payments != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  for (var i in widget.sub.payments!)
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(90),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(
                                    intl.DateFormat("dd/MM/yyyy")
                                        .format(i.payDate),
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: size,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Material(
                                color: secondaryLight,
                                borderRadius: BorderRadius.circular(5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(
                                    f.format(i.value),
                                    style: TextStyle(
                                      fontSize: size,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          : Center(
              child: Text(AppLocalizations.of(context)!.empty),
            ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    animation.addListener(() {
      if (animation.isCompleted) {
        isLoading = false;
        return;
      }
      isLoading = true;
    });
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform:
              // _flipXAxis
              //     ?
              (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
          // // :
          // (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}

int range(DateTime start, DateTime end) {
  final now = DateTime.now();
  if (now.compareTo(start) < 0) {
    return end.difference(start).inDays;
  }
  if (now.compareTo(end) < 0) {
    return end.difference(now).inDays + 1;
  }
  return 0;
}

double percent(DateTime start, DateTime end) {
  final now = DateTime.now();
  if (end.compareTo(start) == 0) {
    return now.compareTo(end) == 0 ? 1.0 : 0.0;
  }
  if (now.compareTo(end) < 0) {
    return ((end.difference(now).inDays + 1) / end.difference(start).inDays);
  }
  return 0.0;
}
