import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/presentation/performance/widgets/muscle_difference_widget.dart';
import 'package:uniceps/core/constants/muscles_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const imgs = [
  MusclesImages.height,
  MusclesImages.weight,
  MusclesImages.neck,
  MusclesImages.shoulder,
  MusclesImages.chest,
  MusclesImages.waist,
  MusclesImages.lArm,
  MusclesImages.rArm,
  MusclesImages.lThigh,
  MusclesImages.rThigh,
  MusclesImages.lLeg,
  MusclesImages.rLeg,
  MusclesImages.hips,
];

class MeasurementToolScreen extends StatelessWidget {
  const MeasurementToolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Measurements Tool'),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                      icon: const Icon(Icons.calendar_month),
                      hint: Text('01/01/2000'),
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      items: List.generate(5, (i) => DateFormat.yMd().format(DateTime(2000 + i, i)))
                          .map((date) => DropdownMenuItem(value: date, child: Text(date)))
                          .toList(),
                      onChanged: (v) {}),
                  Icon(Icons.arrow_right_alt_outlined),
                  DropdownButton(
                      icon: const Icon(Icons.calendar_month),
                      hint: Text('01/01/2000'),
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      items: List.generate(5, (i) => DateFormat.yMd().format(DateTime(2000 + i, i)))
                          .map((date) => DropdownMenuItem(
                                value: date,
                                child: Text(date),
                              ))
                          .toList(),
                      onChanged: (v) {}),
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemCount: imgs.length,
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemBuilder: (context, i) {
              return MuscleDifferenceWidget(
                image: imgs[i],
                muscleName: muscleNameMapper(i, locale),
              );
            },
          ),
        ],
      ),
    );
  }

  String muscleNameMapper(int index, AppLocalizations l) {
    switch (index) {
      case 0:
        return l.height;

      case 1:
        return l.weight;

      case 2:
        return l.nick;
      case 3:
        return l.shoulders;
      case 4:
        return l.chest;
      case 5:
        return l.waist;
      case 6:
        return l.lArm;
      case 7:
        return l.rArm;
      case 8:
        return l.lThigh;
      case 9:
        return l.rThigh;
      case 10:
        return l.lLeg;
      case 11:
        return l.rLeg;
      case 12:
        return l.hips;
      default:
        return '';
    }
  }
}
