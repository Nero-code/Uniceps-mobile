import 'package:flutter/material.dart';
import 'package:uniceps/features/Profile/data/models/subscription_model.dart';
import 'package:uniceps/features/Profile/domain/entities/subscription.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({
    super.key,
    required this.sub,
  });

  final Subscription sub;
  @override
  Widget build(BuildContext context) {
    print(percent(sub.startDate, sub.endDate));
    final local = AppLocalizations.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("${local!.sport}: ${sub.sportName}"),
                    Text("${local.price}: ${sub.price.toInt()}"),
                    Text(
                        "${local.status}: ${sub.isPaid ? "Paid" : "Not Paid"}"),
                  ],
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        value: percent(sub.startDate, sub.endDate),
                      ),
                      Center(
                        child: Text(
                          range(sub.endDate).toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (sub.discountVal != 0) ...[
              const Divider(),
              Text("Discount Value: ${sub.discountVal}"),
              Text("Discount Description:\n${sub.discountDes}"),
            ],
            if (sub.payments != null)
              for (var i in sub.payments as List<Payment>)
                Text(
                    AppLocalizations.of(context)!.payment + i.value.toString()),
          ],
        ),
      ),
    );
  }
}

int range(DateTime end) {
  final now = DateTime.now();
  if (now.compareTo(end) < 0) {
    return end.difference(now).inDays;
  }
  return 0;
}

double percent(DateTime start, DateTime end) {
  final now = DateTime.now();
  print(end.difference(now).inDays / end.difference(start).inDays);
  if (now.compareTo(end) < 0) {
    return (end.difference(now).inDays / end.difference(start).inDays);
  }
  return 0.0;
}
