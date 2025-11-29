import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:uniceps/app/presentation/measurement/dialogs/delete_dialog.dart';
import 'package:uniceps/app/presentation/measurement/screens/add_edit_measurement_screen.dart';
import 'package:uniceps/app/presentation/measurement/widgets/multifab_menu.dart';
import 'package:uniceps/core/constants/cap_images.dart';
import 'package:uniceps/core/widgets/empty_page.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/core/constants/muscles_images.dart';
import 'package:uniceps/app/domain/classes/profile_classes/measrument.dart';
import 'package:uniceps/app/presentation/measurement/blocs/measurement/measurment_bloc.dart';
import 'package:uniceps/app/presentation/measurement/widgets/measure_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({super.key});

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> with TickerProviderStateMixin {
  final duration = const Duration(milliseconds: 500);

  int page = 0;
  bool isLoading = false;
  bool isLeft = false;
  Widget child = const SizedBox();

  Future<void> animate(bool isNext) async {
    // isLoading = true;
    // setState(() {});
    // await Future.delayed(const Duration(milliseconds: 500));
    // print("currentPAge:  $page");
    // print("isLoading:  $isLoading");

    isLeft = isNext;
    isNext ? ++page : --page;

    // isLoading = false;
    // childBuilder();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context)!;
    final isRtl = context.read<LocaleCubit>().state.isRtl();
    return BlocProvider(
      create: (context) => MeasurementBloc(di.sl())..add(const MeasurementEvent.getMeasurements()),
      lazy: false,
      child: Scaffold(
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
              loaded: (state) {
                childBuilder(state.list[page]);
                return Stack(
                  children: [
                    GestureDetector(
                      onHorizontalDragEnd: (details) async {
                        if (isLoading) return;

                        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
                          // print("Left");
                          if (page < state.list.length - 1) {
                            // ++page;
                            await animate(true);
                          }
                        } else if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
                          // print("Right");
                          if (page > 0) {
                            // --page;
                            await animate(false);
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PageTransitionSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  reverse: isLeft,
                                  transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                                    return SharedAxisTransition(
                                      animation: primaryAnimation,
                                      secondaryAnimation: secondaryAnimation,
                                      transitionType: SharedAxisTransitionType.horizontal,
                                      child: child,
                                    );
                                  },
                                  child: SizedBox(
                                    key: ValueKey<int>(page),
                                    child: child,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 25,
                      child: BackButton(),
                    ),
                    Positioned(
                      bottom: 0.0,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                                side: BorderSide(color: Colors.grey.shade300),
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.white,
                                surfaceTintColor: Colors.blue),
                            onPressed: () async {
                              //  RTL  -->  Left (previous)
                              if (isLoading) return;

                              if (isRtl && page > 0) {
                                await animate(false);
                              }
                              if (!isRtl && page < state.list.length - 1) {
                                await animate(true);
                              }
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          PageTransitionSwitcher(
                            duration: const Duration(milliseconds: 500),
                            reverse: isLeft,
                            transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
                              animation: primaryAnimation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType: SharedAxisTransitionType.horizontal,
                              child: child,
                            ),
                            child: Text(
                              key: ValueKey<String>("$page"),
                              intl.DateFormat("dd/MM/yyyy").format(state.list[page].checkDate),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                                side: BorderSide(color: Colors.grey.shade300),
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.white,
                                surfaceTintColor: Colors.blue),
                            onPressed: () async {
                              //  RTL  -->  Right (Next)
                              if (isLoading) return;
                              if (isRtl && page < state.list.length - 1) {
                                await animate(true);
                              }
                              if (!isRtl && page > 0) {
                                await animate(false);
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned.directional(
                      top: 30,
                      end: 20,
                      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                      child: AnimatedStackMenu(
                        spacing: 50,
                        direction: isRtl ? Direction.left : Direction.right,
                        toggleButton: (animation, toggle) => IconButton.filled(
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.grey.shade700,
                            backgroundColor: Colors.grey.shade200,
                          ),
                          onPressed: toggle,
                          icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
                        ),
                        children: [
                          IconButton.filled(
                            style: IconButton.styleFrom(
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.blue.shade50,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                        value: context.read<MeasurementBloc>(),
                                        child: const AddEditMeasurementScreen(),
                                      )),
                            ),
                            icon: const Icon(Icons.add),
                          ),
                          IconButton.filled(
                            style: IconButton.styleFrom(
                              foregroundColor: Colors.green,
                              backgroundColor: Colors.green.shade50,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<MeasurementBloc>(),
                                  child: AddEditMeasurementScreen(m: state.list[page]),
                                ),
                              ),
                            ),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton.filled(
                            style: IconButton.styleFrom(
                              foregroundColor: Colors.red,
                              backgroundColor: Colors.red.shade50,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => BlocProvider.value(
                                        value: context.read<MeasurementBloc>(),
                                        child: DeleteDialog(
                                            onPositive: () => context
                                                .read<MeasurementBloc>()
                                                .add(MeasurementEvent.deleteMeasurement(state.list[page])),
                                            itemName:
                                                "${locale.record} ${intl.DateFormat.yMd().format(state.list[page].checkDate)}"),
                                      ));
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              error: (state) {
                return SizedBox.expand(
                  child: Stack(
                    children: [
                      Positioned.directional(
                        top: 30.0,
                        end: 20.0,
                        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.blue.shade50,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                      value: context.read<MeasurementBloc>(),
                                      child: const AddEditMeasurementScreen(),
                                    )),
                          ),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                      Center(
                          child: EmptyPage(
                        imageName: CaptainImages.emptyMeasurement,
                        message: locale.emptyMeasurements,
                        imageSize: Size(screen.width * .7, screen.width * .7),
                      )),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void childBuilder(Measurement m) {
    final local = AppLocalizations.of(context)!;
    const verticalGap = 5.0;
    child = SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MeasureWidget(image: MusclesImages.shoulder, title: local.shoulders, value: m.shoulders),
                MeasureWidget(image: MusclesImages.neck, title: local.nick, value: m.neck),
                MeasureWidget(image: MusclesImages.height, title: local.height, value: m.height),
              ],
            ),
            const SizedBox(height: verticalGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MeasureWidget(image: MusclesImages.rArm, title: local.lArm, value: m.lArm),
                MeasureWidget(image: MusclesImages.chest, title: local.chest, value: m.chest),
                MeasureWidget(image: MusclesImages.lArm, title: local.rArm, value: m.rArm),
              ],
            ),
            const SizedBox(height: verticalGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MeasureWidget(image: MusclesImages.rThigh, title: local.lThigh, value: m.lThigh),
                MeasureWidget(image: MusclesImages.waist, title: local.waist, value: m.waist),
                MeasureWidget(image: MusclesImages.lThigh, title: local.rThigh, value: m.rThigh),
              ],
            ),
            const SizedBox(height: verticalGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MeasureWidget(image: MusclesImages.rLeg, title: local.lLeg, value: m.lLeg), // rLeg
                MeasureWidget(image: MusclesImages.hips, title: local.hips, value: m.hips),

                MeasureWidget(image: MusclesImages.lLeg, title: local.rLeg, value: m.rLeg),
              ],
            ),
            const SizedBox(height: verticalGap),
            MeasureWidget(image: MusclesImages.weight, title: local.weight, isCm: false, value: m.weight),
          ],
        ),
      ),
    );
  }
}
