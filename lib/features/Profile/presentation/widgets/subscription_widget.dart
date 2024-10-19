import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    // print(percent(sub.startDate, sub.endDate));
    final local = AppLocalizations.of(context)!;
    // final isRtl = context.read<ChangedLangState>().isRtl();
    // final isRtl = BlocProvider.of<LocaleCubit>(context).state.isRtl();
    final f = NumberFormat("###,###,###.##");
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${local.sport}: ${sub.sportName}"),
                    Text("${local.trainer}: ${sub.trainerName}"),
                    Text(
                        "${local.status}: ${sub.isPaid ? local.paid : local.notPaid}"),
                    Text("${local.price}: ${f.format(sub.price)}"),
                  ],
                ),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.grey.shade200,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 5,
                        strokeAlign: -1.0,
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
              Text("${sub.discountDes}"),
            ],
            if (sub.payments != null && sub.payments!.isNotEmpty) ...[
              const Divider(),
              for (int i = 0; i < sub.payments!.length; i++)
                Text(
                  "${local.payment} (${i + 1}): "
                  "${f.format(sub.payments![i].value)}",
                ),
            ]
          ],
        ),
      ),
    );
  }
}

int range(DateTime end) {
  final now = DateTime.now();
  if (now.compareTo(end) < 0) {
    return end.difference(now).inDays + 1;
  }
  return 0;
}

double percent(DateTime start, DateTime end) {
  final now = DateTime.now();
  // print(end.difference(now).inDays / end.difference(start).inDays);
  if (now.compareTo(end) < 0) {
    return (end.difference(now).inDays / end.difference(start).inDays);
  }
  return 0.0;
}
