import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/presentation/measurement/blocs/measurement/measurment_bloc.dart';
import 'package:uniceps/app/presentation/measurement/dialogs/set_measure_dialog.dart';
import 'package:uniceps/app/presentation/measurement/widgets/body_measurement_map.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AddEditMeasurementScreen extends StatefulWidget {
  const AddEditMeasurementScreen({super.key, this.m});

  final Measurement? m;

  @override
  State<AddEditMeasurementScreen> createState() => _AddEditMeasurementScreenState();
}

class _AddEditMeasurementScreenState extends State<AddEditMeasurementScreen> {
  late Measurement measure;

  @override
  void initState() {
    super.initState();
    measure = widget.m ?? Measurement.empty();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: measure.checkDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != measure.checkDate) {
      setState(() => measure = measure.copyWith(checkDate: picked));
    }
  }

  void _onEditPart(String title, double current, String key) {
    showDialog(
      context: context,
      builder: (_) => SetMeasureDialog(
        title: title,
        initial: current.toString(),
        onPositive: (val) {
          setState(() {
            switch (key) {
              case 'height':
                measure = measure.copyWith(height: val);
                break;
              case 'weight':
                measure = measure.copyWith(weight: val);
                break;
              case 'neck':
                measure = measure.copyWith(neck: val);
                break;
              case 'shoulders':
                measure = measure.copyWith(shoulders: val);
                break;
              case 'chest':
                measure = measure.copyWith(chest: val);
                break;
              case 'waist':
                measure = measure.copyWith(waist: val);
                break;
              case 'lArm':
                measure = measure.copyWith(lArm: val);
                break;
              case 'rArm':
                measure = measure.copyWith(rArm: val);
                break;
              case 'lThigh':
                measure = measure.copyWith(lThigh: val);
                break;
              case 'rThigh':
                measure = measure.copyWith(rThigh: val);
                break;
              case 'lLeg':
                measure = measure.copyWith(lLeg: val);
                break;
              case 'rLeg':
                measure = measure.copyWith(rLeg: val);
                break;
              case 'hips':
                measure = measure.copyWith(hips: val);
                break;
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: _pickDate,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today_rounded, size: 16, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  intl.DateFormat('MMM d, yyyy').format(measure.checkDate),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // General Stats (Height/Weight)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    icon: Icons.height_rounded,
                    label: locale.height,
                    value: "${measure.height}",
                    unit: "cm",
                    onTap: () => _onEditPart(locale.height, measure.height, 'height'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SummaryCard(
                    icon: Icons.monitor_weight_rounded,
                    label: locale.weight,
                    value: "${measure.weight}",
                    unit: "kg",
                    onTap: () => _onEditPart(locale.weight, measure.weight, 'weight'),
                  ),
                ),
              ],
            ),
          ),

          // Body Map
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BodyMeasurementMap(measurement: measure, onSelectPart: _onEditPart),
              ),
            ),
          ),

          // Footer Action
          Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, MediaQuery.paddingOf(context).bottom + 16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () async {
                final bloc = context.read<MeasurementBloc>();
                if (measure.id == null) {
                  bloc.add(MeasurementEvent.createMeasurement(measure));
                } else {
                  bloc.add(MeasurementEvent.updateMeasurement(measure));
                }
                final st = await bloc.stream.skip(1).first;
                st.maybeMap(
                  dirty: (_) => Navigator.pop(context),
                  error: (s) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(locale.error, style: const TextStyle(color: Colors.white)),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  orElse: () {},
                );
              },
              child: Text(
                locale.save.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final VoidCallback onTap;

  const _SummaryCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 18, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                  const SizedBox(width: 4),
                  Text(
                    unit,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
