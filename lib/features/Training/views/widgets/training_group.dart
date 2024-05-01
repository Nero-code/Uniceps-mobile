import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uniceps/main_cubit/locale_cubit.dart';

class TrainingGroup extends StatelessWidget {
  const TrainingGroup({
    super.key,
    required this.order,
  });

  final int order;

  @override
  Widget build(BuildContext context) {
    var local = BlocProvider.of<LocaleCubit>(context).state.locale;
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
            // right: Radius.circular(local.languageCode == 'en' ? 50 : 0),
            // left: Radius.circular(local.languageCode == 'ar' ? 50 : 0),
            ),
        color: Colors.grey.shade300,
      ),
      // margin: EdgeInsets.only(
      //     right: local.languageCode == 'en' ? 15 : 0,
      //     left: local.languageCode == 'ar' ? 15 : 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "$order",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            width: 2,
            height: double.infinity,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Training Group Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Number of Excersises: 3"),
              ],
            ),
          ),
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(
                right: local.languageCode == 'en' ? 7 : 0,
                left: local.languageCode == 'ar' ? 7 : 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
