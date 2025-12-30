import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';

class PlanWidget extends StatelessWidget {
  const PlanWidget({super.key, required this.item, required this.onTap, required this.value});

  final PlanItem item;
  final VoidCallback onTap;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, top: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, offset: const Offset(0.0, 1.0), blurRadius: 2, spreadRadius: .5),
        ],
      ),
      child: Badge(
        label: Icon(Icons.card_giftcard_rounded, color: Colors.amber),
        alignment: AlignmentDirectional.lerp(AlignmentDirectional.topStart, AlignmentDirectional.topCenter, 0.3),
        isLabelVisible: item.isFree,
        backgroundColor: Colors.transparent,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio(value: value),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "\$${intl.NumberFormat.decimalPattern().format(item.price)}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.timelapse, size: 14),
                          const SizedBox(width: 5.0),
                          Text(item.durationString, textDirection: TextDirection.ltr),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
