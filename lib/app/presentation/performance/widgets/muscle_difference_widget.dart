import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MuscleDifferenceWidget extends StatelessWidget {
  const MuscleDifferenceWidget({super.key, required this.image, required this.muscleName});

  final String image, muscleName;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(muscleName, style: TextStyle(fontSize: 10)),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(image),
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          Expanded(
              child: Column(
            children: [
              Text(locale.before, style: TextStyle(fontSize: 11)),
              Text(
                '50.0',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Text(locale.after, style: TextStyle(fontSize: 11)),
              Text(
                '55.0',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Text(
                '%',
                style: TextStyle(fontSize: 11),
              ),
              Text(
                '10%',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
