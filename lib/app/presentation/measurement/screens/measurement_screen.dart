import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/presentation/measurement/blocs/measurement/measurment_bloc.dart';
import 'package:uniceps/app/presentation/measurement/dialogs/delete_dialog.dart';
import 'package:uniceps/app/presentation/measurement/screens/add_edit_measurement_screen.dart';
import 'package:uniceps/app/presentation/measurement/widgets/body_measurement_map.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/widgets/empty_page.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/l10n/app_localizations.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({super.key});

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> with TickerProviderStateMixin {
  int page = 0;
  bool isNextPage = false;

  void _animate(bool next, int max) {
    if (next && page < max - 1) {
      setState(() {
        isNextPage = true;
        page++;
      });
    } else if (!next && page > 0) {
      setState(() {
        isNextPage = false;
        page--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return BlocProvider(
      create: (context) => MeasurementBloc(di.sl())..add(const MeasurementEvent.getMeasurements()),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(title: Text(locale.measurements), centerTitle: true),
        body: BlocConsumer<MeasurementBloc, MeasurementState>(
          listener: (context, state) => state.whenOrNull(
            dirty: () => context.read<MeasurementBloc>().add(const MeasurementEvent.getMeasurements()),
          ),
          buildWhen: (_, current) => current.maybeWhen(orElse: () => true, dirty: () => false),
          builder: (context, state) {
            return state.map(
              initial: (_) => const SizedBox(),
              dirty: (_) => const SizedBox(),
              loading: (_) => const LoadingIndicator(),
              error: (e) => _buildEmptyState(context, locale),
              loaded: (state) {
                if (state.list.isEmpty) return _buildEmptyState(context, locale);

                final m = state.list[page];

                return Column(
                  children: [
                    // Date Selector / Navigation
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _NavButton(
                            icon: Icons.chevron_left_rounded,
                            onPressed: () => _animate(isRtl, state.list.length),
                            enabled: isRtl ? page < state.list.length - 1 : page > 0,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            child: PageTransitionSwitcher(
                              duration: const Duration(milliseconds: 400),
                              reverse: !isNextPage,
                              transitionBuilder: (child, animation, secondaryAnimation) => SharedAxisTransition(
                                animation: animation,
                                secondaryAnimation: secondaryAnimation,
                                transitionType: SharedAxisTransitionType.horizontal,
                                child: child,
                              ),
                              child: Column(
                                key: ValueKey<int>(page),
                                children: [
                                  Text(
                                    intl.DateFormat("MMMM d, yyyy").format(m.checkDate),
                                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                                  ),
                                  Text(
                                    "${page + 1} of ${state.list.length}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _NavButton(
                            icon: Icons.chevron_right_rounded,
                            onPressed: () => _animate(!isRtl, state.list.length),
                            enabled: isRtl ? page > 0 : page < state.list.length - 1,
                          ),
                        ],
                      ),
                    ),

                    // Body Map View
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
                        ),
                        child: PageTransitionSwitcher(
                          duration: const Duration(milliseconds: 400),
                          reverse: !isNextPage,
                          transitionBuilder: (child, animation, secondaryAnimation) => SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child,
                          ),
                          child: BodyMeasurementMap(
                            key: ValueKey<int>(m.id ?? page),
                            measurement: m,
                            onSelectPart: (title, val, key) {
                              // In view mode, maybe show a trend or just open edit
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<MeasurementBloc>(),
                                    child: AddEditMeasurementScreen(m: m),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Quick Stats Bar
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          _CompactStat(label: locale.height, value: "${m.height}", unit: "cm"),
                          const SizedBox(width: 12),
                          _CompactStat(label: locale.weight, value: "${m.weight}", unit: "kg"),
                        ],
                      ),
                    ),

                    // Floating Action Menu
                    _buildActionDock(context, m, locale, isRtl),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations locale) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyPage(
            imageName: CaptainImages.emptyMeasurement,
            message: locale.emptyMeasurements,
            imageSize: Size(MediaQuery.sizeOf(context).width * .6, MediaQuery.sizeOf(context).width * .6),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    BlocProvider.value(value: context.read<MeasurementBloc>(), child: const AddEditMeasurementScreen()),
              ),
            ),
            icon: const Icon(Icons.add_rounded),
            label: Text(locale.add.toUpperCase()),
          ),
        ],
      ),
    );
  }

  Widget _buildActionDock(BuildContext context, Measurement m, AppLocalizations locale, bool isRtl) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.fromLTRB(24, 8, 24, MediaQuery.paddingOf(context).bottom + 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _DockAction(
            icon: Icons.delete_outline_rounded,
            color: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<MeasurementBloc>(),
                  child: DeleteDialog(
                    onPositive: () => context.read<MeasurementBloc>().add(MeasurementEvent.deleteMeasurement(m)),
                    itemName: "${locale.record} ${intl.DateFormat('d/M/y').format(m.checkDate)}",
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _DockAction(
              icon: Icons.edit_rounded,
              label: locale.edit,
              color: colorScheme.primary,
              isPrimary: true,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<MeasurementBloc>(),
                    child: AddEditMeasurementScreen(m: m),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          _DockAction(
            icon: Icons.add_rounded,
            color: colorScheme.secondary,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    BlocProvider.value(value: context.read<MeasurementBloc>(), child: const AddEditMeasurementScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;

  const _NavButton({required this.icon, required this.onPressed, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon),
      style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}

class _CompactStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const _CompactStat({required this.label, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colorScheme.onSurfaceVariant),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                    const SizedBox(width: 2),
                    Text(unit, style: TextStyle(fontSize: 10, color: colorScheme.onSurfaceVariant)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DockAction extends StatelessWidget {
  final IconData icon;
  final String? label;
  final Color color;
  final bool isPrimary;
  final VoidCallback onTap;

  const _DockAction({required this.icon, this.label, required this.color, this.isPrimary = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPrimary ? color : color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isPrimary ? Colors.white : color),
              if (label != null) ...[
                const SizedBox(width: 8),
                Text(
                  label!,
                  style: TextStyle(color: isPrimary ? Colors.white : color, fontWeight: FontWeight.bold),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
