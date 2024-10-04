import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/core/widgets/reload_widget.dart';
import 'package:uniceps/features/Profile/presentation/bloc/measurment_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/measure_widget_2.dart';

class MeasurementScreen2 extends StatefulWidget {
  const MeasurementScreen2({super.key});

  @override
  State<MeasurementScreen2> createState() => _MeasurementScreen2State();
}

class _MeasurementScreen2State extends State<MeasurementScreen2> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final screen = MediaQuery.sizeOf(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocBuilder<MeasurmentBloc, MeasurmentState>(
          builder: (context, state) {
        if (state is MeasurementLoadedState) {
          return SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Image(
                    height: screen.height * 0.7,
                    fit: BoxFit.fitHeight,
                    image: const AssetImage("images/muscle-groups/Height.jpg"),
                  ),
                ),

                //  ////////////////////////
                Positioned(
                  top: screen.height * 0.1,
                  width: screen.width,
                  child: Center(
                    child: MeasureWidget2(
                      title: local.nick,
                      value: "a",
                      direction: 0,
                    ),
                  ),
                ),
                // /////////////////////////

                //
                //  L E F T   S I D E
                //

                Positioned(
                  top: screen.height * 0.07,
                  right: 0.0,
                  child: MeasureWidget2(
                    title: local.height,
                    value: "${2}",
                    direction: -1,
                  ),
                ),
                Positioned(
                  top: screen.height * 0.2,
                  // right: screen.width * 0.1,
                  right: 0.0,
                  child: MeasureWidget2(
                    title: local.chest,
                    value: "a",
                    direction: -1,
                  ),
                ),
                Positioned(
                  top: screen.height * 0.3,
                  right: 0.0,
                  child: MeasureWidget2(
                    title: local.lArm,
                    value: "a",
                    direction: -1,
                  ),
                ),
                Positioned(
                  top: screen.height * 0.42,
                  // right: screen.width * 0.1,
                  right: 0.0,
                  child: MeasureWidget2(
                    title: local.waist,
                    value: "a",
                    direction: -1,
                  ),
                ),

                Positioned(
                  bottom: screen.height * 0.4,
                  right: 0.0,
                  child: MeasureWidget2(
                    title: local.lThigh,
                    value: "a",
                    direction: -1,
                  ),
                ),
                Positioned(
                  bottom: screen.height * 0.3,
                  right: 0.0,
                  child: MeasureWidget2(
                    title: local.lLeg,
                    value: "a",
                    direction: -1,
                  ),
                ),
                //
                //  R I G H T   S I D E
                //

                Positioned(
                  top: screen.height * 0.07,
                  left: 0.0,
                  child: MeasureWidget2(
                    title: local.weight,
                    value: "${state.list[page].weight}",
                    direction: 1,
                  ),
                ),

                Positioned(
                  top: screen.height * 0.2,
                  // left: screen.width * 0.1,
                  left: 0.0,
                  child: MeasureWidget2(
                    title: local.shoulders,
                    value: "a",
                    direction: 1,
                  ),
                ),

                Positioned(
                  top: screen.height * 0.3,
                  left: 0.0,
                  child: MeasureWidget2(
                    title: local.rArm,
                    value: "a",
                    direction: 1,
                  ),
                ),

                Positioned(
                  top: screen.height * 0.42,
                  // left: screen.width * 0.1,
                  left: 0.0,
                  child: MeasureWidget2(
                    title: local.hips,
                    value: "a",
                    direction: 1,
                  ),
                ),
                Positioned(
                  bottom: screen.height * 0.4,
                  left: 0.0,
                  child: MeasureWidget2(
                    title: local.rThigh,
                    value: "a",
                    direction: 1,
                  ),
                ),

                Positioned(
                  bottom: screen.height * 0.3,
                  left: 0.0,
                  child: MeasureWidget2(
                    title: local.rLeg,
                    value: "a",
                    direction: 1,
                  ),
                ),
              ],
            ),
          );
        } else if (state is MeasurementErrorState) {
          return Center(
            child: ReloadScreenWidget(
              f: state.f,
              callBack: () => BlocProvider.of<MeasurmentBloc>(context)
                  .add(GetMeasurementsEvent()),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            strokeCap: StrokeCap.round,
          ),
        );
      }),
    );
  }
}
