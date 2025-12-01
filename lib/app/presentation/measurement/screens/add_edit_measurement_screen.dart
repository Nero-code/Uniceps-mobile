import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/data/models/profile_models/measurement_model.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/presentation/measurement/blocs/measurement/measurment_bloc.dart';
import 'package:uniceps/app/presentation/measurement/dialogs/set_measure_dialog.dart';
import 'package:uniceps/app/presentation/measurement/widgets/measure_widget.dart';
import 'package:uniceps/core/constants/muscles_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEditMeasurementScreen extends StatefulWidget {
  const AddEditMeasurementScreen({super.key, this.m});

  final Measurement? m;

  @override
  State<AddEditMeasurementScreen> createState() => _AddEditMeasurementScreenState();
}

class _AddEditMeasurementScreenState extends State<AddEditMeasurementScreen> {
  final verticalGap = 5.0;

  final Map<String, dynamic> measure = {};
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.m != null) {
      measure.addAll(MeasurementModel.fromEntity(widget.m!).toJson());
      selectedDate = widget.m!.checkDate;
    }
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // default today
      firstDate: DateTime(2000), // earliest allowed date
      lastDate: DateTime(2050), // latest allowed date
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: InkWell(
            onTap: _pickDate,
            borderRadius: BorderRadius.circular(15),
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(intl.DateFormat('d-M-y').format(selectedDate)),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MeasureWidget(
                      image: MusclesImages.shoulder,
                      title: locale.shoulders,
                      value: measure['shoulders'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.shoulders,
                            onPositive: (val) => setState(() => measure.addAll({"shoulders": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.neck,
                      title: locale.nick,
                      value: measure['neck'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.nick, onPositive: (val) => setState(() => measure.addAll({"neck": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.height,
                      title: locale.height,
                      value: measure['height'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.height, onPositive: (val) => setState(() => measure.addAll({"height": val}))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MeasureWidget(
                      image: MusclesImages.rArm,
                      title: locale.lArm,
                      value: measure['l_arm'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.lArm, onPositive: (val) => setState(() => measure.addAll({"l_arm": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.chest,
                      title: locale.chest,
                      value: measure['chest'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.chest, onPositive: (val) => setState(() => measure.addAll({"chest": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.lArm,
                      title: locale.rArm,
                      value: measure['r_arm'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.rArm, onPositive: (val) => setState(() => measure.addAll({"r_arm": val}))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MeasureWidget(
                      image: MusclesImages.rThigh,
                      title: locale.lThigh,
                      value: measure['l_thigh'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.lThigh,
                            onPositive: (val) => setState(() => measure.addAll({"l_thigh": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.waist,
                      title: locale.waist,
                      value: measure['waist'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.waist, onPositive: (val) => setState(() => measure.addAll({"waist": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.lThigh,
                      title: locale.rThigh,
                      value: measure['r_thigh'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.rThigh,
                            onPositive: (val) => setState(() => measure.addAll({"r_thigh": val}))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MeasureWidget(
                      image: MusclesImages.rLeg,
                      title: locale.lLeg,
                      value: measure['l_leg'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.lLeg, onPositive: (val) => setState(() => measure.addAll({"l_leg": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.hips,
                      title: locale.hips,
                      value: measure['hips'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.hips, onPositive: (val) => setState(() => measure.addAll({"hips": val}))),
                      ),
                    ),
                    MeasureWidget(
                      image: MusclesImages.lLeg,
                      title: locale.rLeg,
                      value: measure['r_leg'],
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => SetMeasureDialog(
                            title: locale.rLeg, onPositive: (val) => setState(() => measure.addAll({"r_leg": val}))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: verticalGap),
                MeasureWidget(
                  image: MusclesImages.weight,
                  title: locale.weight,
                  isCm: false,
                  value: measure['weight'],
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => SetMeasureDialog(
                        title: locale.hips, onPositive: (val) => setState(() => measure.addAll({"weight": val}))),
                  ),
                ),
                SizedBox(height: verticalGap * 3),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .75,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
                      onPressed: measure.isNotEmpty
                          ? () async {
                              final bloc = context.read<MeasurementBloc>();
                              if (measure['id'] == null) {
                                bloc.add(MeasurementEvent.createMeasurement(assemble(measure)));
                              } else {
                                bloc.add(MeasurementEvent.updateMeasurement(assemble(measure)));
                              }
                              final st = await bloc.stream.skip(1).first;
                              st.maybeMap(
                                dirty: (_) => Navigator.pop(context),
                                error: (s) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    locale.error,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                )),
                                orElse: () {},
                              );
                            }
                          : null,
                      child: Text(
                        locale.save,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  Measurement assemble(Map<String, dynamic> json) => Measurement(
        id: json['id'],
        apiId: json['api_id'],
        height: json['height'] ?? 0.0,
        weight: json['weight'] ?? 0.0,
        lArm: json['l_arm'] ?? 0.0,
        rArm: json['r_arm'] ?? 0.0,
        lHumerus: json['l_humerus'] ?? 0.0,
        rHumerus: json['r_humerus'] ?? 0.0,
        lLeg: json['l_leg'] ?? 0.0,
        rLeg: json['r_leg'] ?? 0.0,
        lThigh: json['l_thigh'] ?? 0.0,
        rThigh: json['r_thigh'] ?? 0.0,
        neck: json['neck'] ?? 0.0,
        shoulders: json['shoulders'] ?? 0.0,
        waist: json['waist'] ?? 0.0,
        chest: json['chest'] ?? 0.0,
        hips: json['hips'] ?? 0.0,
        checkDate: selectedDate,
        version: json['version'] ?? 0,
        isSynced: json['is_synced'] ?? false,
      );
}
