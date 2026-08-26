import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/presentation/measurement/blocs/measurement/measurment_bloc.dart';
import 'package:uniceps/app/presentation/measurement/dialogs/set_measure_dialog.dart';
import 'package:uniceps/app/presentation/measurement/widgets/measure_widget.dart';
import 'package:uniceps/core/constants/muscles_images.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class AddEditMeasurementScreen extends StatefulWidget {
  const AddEditMeasurementScreen({super.key, this.m});

  final Measurement? m;

  @override
  State<AddEditMeasurementScreen> createState() => _AddEditMeasurementScreenState();
}

class _AddEditMeasurementScreenState extends State<AddEditMeasurementScreen> {
  final verticalGap = 5.0;

  late Measurement measure;
  // DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // if (widget.m != null) {
    //   // measure.addAll(MeasurementModel.fromEntity(widget.m!).toJson());
    //   measure = widget.m!;
    //   // selectedDate = widget.m!.checkDate;
    // }else{
    //   measure
    // }
    measure = widget.m == null ? Measurement.empty() : widget.m!;
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: measure.checkDate, // default today
      firstDate: DateTime(2000), // earliest allowed date
      lastDate: DateTime(2050), // latest allowed date
    );

    if (picked != null && picked != measure.checkDate) {
      setState(() => measure = measure.copyWith(checkDate: picked));
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
            decoration: BoxDecoration(color: Colors.white.withAlpha(50), borderRadius: BorderRadius.circular(15)),
            child: Text(intl.DateFormat('d-M-y').format(measure.checkDate)),
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
                    value: measure.shoulders,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.shoulders,
                        onPositive: (val) => setState(() => measure = measure.copyWith(shoulders: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.neck,
                    title: locale.nick,
                    value: measure.neck,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.nick,
                        onPositive: (val) => setState(() => measure = measure.copyWith(neck: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.height,
                    title: locale.height,
                    value: measure.height,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.height,
                        onPositive: (val) => setState(() => measure = measure.copyWith(height: val)),
                      ),
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
                    value: measure.lArm,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.lArm,
                        onPositive: (val) => setState(() => measure = measure.copyWith(lArm: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.chest,
                    title: locale.chest,
                    value: measure.chest,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.chest,
                        onPositive: (val) => setState(() => measure = measure.copyWith(chest: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.lArm,
                    title: locale.rArm,
                    value: measure.rArm,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.rArm,
                        onPositive: (val) => setState(() => measure = measure.copyWith(rArm: val)),
                      ),
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
                    value: measure.lThigh,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.lThigh,
                        onPositive: (val) => setState(() => measure = measure.copyWith(lThigh: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.waist,
                    title: locale.waist,
                    value: measure.waist,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.waist,
                        onPositive: (val) => setState(() => measure = measure.copyWith(waist: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.lThigh,
                    title: locale.rThigh,
                    value: measure.rThigh,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.rThigh,
                        onPositive: (val) => setState(() => measure = measure.copyWith(rThigh: val)),
                      ),
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
                    value: measure.lLeg,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.lLeg,
                        onPositive: (val) => setState(() => measure = measure.copyWith(lLeg: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.hips,
                    title: locale.hips,
                    value: measure.hips,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.hips,
                        onPositive: (val) => setState(() => measure = measure.copyWith(hips: val)),
                      ),
                    ),
                  ),
                  MeasureWidget(
                    image: MusclesImages.lLeg,
                    title: locale.rLeg,
                    value: measure.rLeg,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => SetMeasureDialog(
                        title: locale.rLeg,
                        onPositive: (val) => setState(() => measure = measure.copyWith(rLeg: val)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: verticalGap),
              MeasureWidget(
                image: MusclesImages.weight,
                title: locale.weight,
                isCm: false,
                value: measure.weight,
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => SetMeasureDialog(
                    title: locale.hips,
                    onPositive: (val) => setState(() => measure = measure.copyWith(weight: val)),
                  ),
                ),
              ),
              SizedBox(height: verticalGap * 3),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
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
                    locale.save,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
