import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/plans/blocs/plans_bloc.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethodDialog extends StatelessWidget {
  const PaymentMethodDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return AlertDialog(
      icon: const Icon(Icons.attach_money, size: 50),
      content: BlocBuilder<PlansBloc, PlansState>(
        builder: (context, state) => state.maybeWhen(
          buyPlanAndReset: (paymentResponse) {
            if (!paymentResponse.requirePayment) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(locale.paymentDone),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 0.5, color: Theme.of(context).colorScheme.primary),
                      elevation: 3,
                    ),
                    onPressed: () {
                      context.read<MembershipBloc>().add(const MembershipEvent.getCurrentPlan());
                      Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.home);
                    },
                    label: Text(locale.ok),
                    icon: const Icon(Icons.done),
                  ),
                ],
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(locale.paymentDialogContent),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 0.5, color: Theme.of(context).colorScheme.primary),
                          elevation: 3,
                        ),
                        onPressed: () {
                          launchUrl(Uri.parse(TELEGRAM));
                          Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.home);
                          // SystemNavigator.pop();
                        },
                        label: Text(locale.cash),
                        icon: const Icon(Icons.payments_rounded),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 0.5, color: Theme.of(context).colorScheme.primary),
                          elevation: 3,
                        ),
                        onPressed: (paymentResponse.paymentUrl == null || paymentResponse.paymentUrl!.isEmpty)
                            ? null
                            : () {
                                launchUrl(Uri.parse(paymentResponse.paymentUrl!));
                                Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.home);
                                // SystemNavigator.pop();
                              },
                        label: Text(locale.card),
                        icon: const Icon(Icons.payment_rounded),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          orElse: () => const SizedBox(height: 50, child: LoadingIndicator()),
        ),
      ),
    );
  }
}
