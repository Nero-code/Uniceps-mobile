import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:uniceps/app/presentation/home/widgets/captain_uni_card.dart';
import 'package:uniceps/app/presentation/plans/blocs/plans_bloc.dart';
import 'package:uniceps/app/presentation/plans/dialogs/payment_confirm_dialog.dart';
import 'package:uniceps/app/presentation/plans/dialogs/payment_method_dialog.dart';
import 'package:uniceps/app/presentation/plans/widgets/plan_widget.dart';
import 'package:uniceps/app/presentation/screens/error_page.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/l10n/app_localizations.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  PlanItem? selectedPlan;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final ltr = context.read<LocaleCubit>().state.locale.languageCode == 'en';
    final screen = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => PlansBloc(di.sl())..add(const PlansEvent.getPlan()),
      lazy: false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 70),
                child: Column(
                  children: [
                    BlocBuilder<MembershipBloc, MembershipState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loaded: (m) => AlertBar(
                            content: Text(
                              locale.memberDurationAlart(
                                "${m.endDate.difference(DateTime.now()).inDays}",
                                DateFormat.yMd().format(m.endDate),
                              ),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                          orElse: () => const SizedBox(),
                        );
                      },
                    ),
                    CaptainUniCard(
                      imagePath: CaptainImages.membership,
                      needsFlip: true,
                      content: locale.captainUniUpgradeQuote,
                      gradient: LinearGradient(
                        colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary],
                      ),
                    ),
                    SizedBox(width: screen.width),
                    BlocBuilder<PlansBloc, PlansState>(
                      buildWhen: (previous, current) =>
                          current.maybeWhen(orElse: () => true, buyPlanAndReset: (i) => false),
                      builder: (context, state) => state.when(
                        initial: () => const SizedBox(),
                        loading: () => const Padding(padding: EdgeInsets.all(8.0), child: LoadingIndicator()),
                        loaded: (plan) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: RadioGroup<int>(
                            onChanged: (index) => setState(() => selectedPlan = plan.items[index ?? 0]),
                            groupValue: plan.items.indexWhere((p) => p.id == selectedPlan?.id),

                            child: Row(
                              children: plan.items
                                  .map(
                                    (item) => PlanWidget(
                                      item: item,
                                      onTap: () => setState(() => selectedPlan = item),
                                      value: plan.items.indexOf(item),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        buyPlanAndReset: (i) {
                          return const SizedBox();
                        },
                        error: (f) => ErrorPage(message: f.getErrorMessage()),
                      ),
                    ),
                    DataTable(
                      columnSpacing: 24,
                      dividerThickness: .5,
                      columns: [
                        DataColumn(
                          label: Text(ltr ? 'Feature' : 'الميزة', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const DataColumn(
                          label: Text('Free', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const DataColumn(
                          label: Text('Premium', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(Text(ltr ? 'Access to Basic Workouts' : 'وصول للتمارين الاساسية')),
                            const DataCell(Icon(Icons.check, color: Colors.green)),
                            const DataCell(Icon(Icons.check, color: Colors.green)),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text(ltr ? 'Custom Workout Plans' : 'برامج تدريبية مخصصة')),
                            const DataCell(Icon(Icons.trip_origin, color: Colors.amber)),
                            const DataCell(Icon(Icons.check, color: Colors.green)),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text(ltr ? 'Progress Tracking' : 'تتبع الانجاز')),
                            const DataCell(Icon(Icons.trip_origin, color: Colors.amber)),
                            const DataCell(Icon(Icons.check, color: Colors.green)),
                          ],
                        ),
                        // DataRow(cells: [
                        //   DataCell(Text('Offline Mode')),
                        //   DataCell(Icon(Icons.close, color: Colors.red)),
                        //   DataCell(Icon(Icons.check, color: Colors.green)),
                        // ]),
                        DataRow(
                          cells: [
                            DataCell(Text(ltr ? 'Ad-Free Experience' : 'تجربة بلا اعلانات')),
                            const DataCell(Icon(Icons.close, color: Colors.red)),
                            const DataCell(Icon(Icons.check, color: Colors.green)),
                          ],
                        ),
                        // DataRow(cells: [
                        //   DataCell(Text('Nutrition Guidance')),
                        //   DataCell(Icon(Icons.close, color: Colors.red)),
                        //   DataCell(Icon(Icons.check, color: Colors.green)),
                        // ]),
                        // DataRow(cells: [
                        //   DataCell(Text('Dark Mode Support')),
                        //   DataCell(Icon(Icons.check, color: Colors.green)),
                        //   DataCell(Icon(Icons.check, color: Colors.green)),
                        // ]),
                        // DataRow(cells: [
                        //   DataCell(Text('Sync with Wearables')),
                        //   DataCell(Icon(Icons.close, color: Colors.red)),
                        //   DataCell(Icon(Icons.check, color: Colors.green)),
                        // ]),
                        // DataRow(cells: [
                        //   DataCell(Text('Community Access')),
                        //   DataCell(Icon(Icons.close, color: Colors.red)),
                        //   DataCell(Icon(Icons.check, color: Colors.green)),
                        // ]),
                        DataRow(
                          cells: [
                            DataCell(Text(ltr ? 'Priority Support' : 'اولوية في الدعم')),
                            const DataCell(Icon(Icons.close, color: Colors.red)),
                            const DataCell(Icon(Icons.check, color: Colors.green)),
                          ],
                        ),
                        // DataRow(cells: [
                        //   DataCell(Text('Daily Reminders')),
                        //   DataCell(Text('Basic')),
                        //   DataCell(Text('Smart & Custom')),
                        // ]),
                        // DataRow(cells: [
                        //   DataCell(Text('Challenges & Rewards')),
                        //   DataCell(Icon(Icons.close, color: Colors.red)),
                        //   DataCell(Icon(Icons.check, color: Colors.green)),
                        // ]),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0.0,
                width: screen.width,
                child: Container(
                  // color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<PlansBloc, PlansState>(
                    buildWhen: (previous, current) =>
                        current.maybeWhen(orElse: () => true, buyPlanAndReset: (res) => false),
                    builder: (context, state) {
                      final activateBtn =
                          selectedPlan != null &&
                          state.maybeWhen(orElse: () => true, loading: () => false, buyPlanAndReset: (_) => false);
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.white),
                        onPressed: activateBtn
                            ? () {
                                showDialog<bool>(
                                  context: context,
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<PlansBloc>(),
                                    child: PaymentConfirmationDialog(
                                      planName: selectedPlan?.durationString ?? '',
                                      onConfirm: selectedPlan != null
                                          ? () {
                                              context.read<PlansBloc>().add(PlansEvent.buyPlan(selectedPlan!));
                                              Navigator.pushReplacement(
                                                context,
                                                DialogRoute(
                                                  context: context,
                                                  builder: (_) => BlocProvider.value(
                                                    value: context.read<PlansBloc>(),
                                                    child: const PaymentMethodDialog(),
                                                  ),
                                                ),
                                              );
                                            }
                                          : null,
                                    ),
                                  ),
                                );
                              }
                            : null,
                        label: Text(locale.buyNow, style: const TextStyle(fontWeight: FontWeight.bold)),
                        icon: const Icon(Icons.attach_money),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
