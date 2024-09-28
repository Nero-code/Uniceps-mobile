import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/features/Auth/data/models/player_model.dart';
import 'package:uniceps/features/Auth/services/enitites/player.dart';
import 'package:uniceps/features/Auth/views/widgets/gender_selection_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/features/Profile/presentation/bloc/profile_bloc.dart';
import 'package:uniceps/features/Profile/presentation/widgets/profile_back_circle.dart';

class PlayerInfoScreen extends StatefulWidget {
  const PlayerInfoScreen({super.key, /**required this.onSave,*/ this.player});

  final Player? player;
  // final void Function(Player) onSave;

  @override
  State<PlayerInfoScreen> createState() => _PlayerInfoScreenState();
}

class _PlayerInfoScreenState extends State<PlayerInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtl = TextEditingController();
  final phoneCtl = TextEditingController();
  final birthCtl = TextEditingController();

  final decoration = InputDecoration(
    border: InputBorder.none,
    fillColor: background,
  );

  bool? male;

  bool isCreate = true;

  // @override
  // void initState() {
  //   if (widget.player != null) {
  //     // nameCtl.text = widget.player!.name;
  //     // phoneCtl.text = widget.player!.phoneNum;
  //     // birthCtl.text = widget.player!.birthDate;
  //     // male = widget.player!.gender == Gender.male;
  //     print("initState()");
  //   }
  //   print("initState()");

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       systemNavigationBarColor: Theme.of(context).colorScheme.background,
    //       statusBarIconBrightness: Brightness.dark),
    // );
    // final args = ModalRoute.of(context)!.settings.arguments as PlayerArguments;
    final local = AppLocalizations.of(context);
    print("Build()");
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        print("Inside onPopInvoked");
        print("Inside onPopInvoked --> context.mounted ${context.mounted}");
        if (didPop) return;
        if (context.mounted) {
          Navigator.pop(context, false);
        }
      },
      child: Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            print("state is: ${state.runtimeType}");
            if (state is ProfileSubmittedState) {
              print("state is Submitted");
              Navigator.pop(context, true);
              return;
            }
          },
          builder: (context, state) {
            if (state is ProfileLoadedState) {
              isCreate = false;
              nameCtl.text = state.player.name;
              phoneCtl.text = state.player.phoneNum;
              birthCtl.text = state.player.birthDate;
              male = state.player.gender == Gender.male;
              print(male);
              print("FOUND: Profile already exists");
            }
            return Stack(
              children: [
                Positioned(
                  top: 0.0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CustomPaint(
                    painter: ProfileBackgroundCircle(),
                  ),
                ),
                SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.13,
                              child: const Center(
                                child: Text(
                                  "osamasda111@gmail.com",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),

                            ///   A P P   L O G O
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              child: const Icon(
                                Icons.account_circle,
                                size: 100,
                                color: Color.fromARGB(255, 61, 170, 184),
                              ),
                            ),

                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  ///
                                  ///  N A M E
                                  ///
                                  TextFormField(
                                    controller: nameCtl,
                                    decoration: InputDecoration(
                                      labelText: local!.pName,
                                      // prefix: Text(
                                      //   local!.pName,
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      isDense: true,
                                    ),
                                    onChanged: (val) {
                                      if (val.contains(RegExp(r"[0-9]"))) {
                                        phoneCtl.text =
                                            val.substring(0, val.length - 1);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return local.pNameError;
                                      }
                                      return null;
                                    },
                                  ),

                                  ///
                                  ///  P H O N E   N U M B E R
                                  ///
                                  TextFormField(
                                    controller: phoneCtl,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      labelText: local.phoneNum,
                                      isDense: true,
                                    ),
                                    maxLength: 10,
                                    onChanged: (val) {
                                      if (val.contains(RegExp(r"[^0-9]"))) {
                                        phoneCtl.text =
                                            val.substring(0, val.length - 1);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 10) {
                                        return local.phoneNumError;
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),

                                  ///
                                  ///  G E N D E R   A N D   B I R T H D A T E
                                  ///
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GenderSelectBox(
                                        onSelect: (selected) => male = selected,
                                        initialValue: male,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: TextFormField(
                                          controller: birthCtl,
                                          decoration: InputDecoration(
                                            label: Text(local.birthDate),
                                            isDense: true,
                                          ),
                                          maxLength: 4,
                                          keyboardType: TextInputType.phone,
                                          onChanged: (val) {
                                            if (val
                                                .contains(RegExp(r"[^0-9]"))) {
                                              birthCtl.text = val.substring(
                                                  0, val.length - 1);
                                            }
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value.length < 4) {
                                              return local.birthDateError;
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  ///  H E I G H T
                                  // TextFormField(
                                  //   decoration: InputDecoration(
                                  //     labelText: "Height (cm)",
                                  //     isDense: true,
                                  //   ),
                                  //   maxLength: 3,
                                  //   validator: (value) {
                                  //     if (value == null || value.isEmpty) {
                                  //       return "please put a valid height";
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),

                                  ///  W E I G H T
                                  // TextFormField(
                                  //   decoration: InputDecoration(
                                  //     labelText: "Weight (Kg)",
                                  //     isDense: true,
                                  //   ),
                                  //   validator: (value) {
                                  //     if (value == null || value.isEmpty) {
                                  //       return "please put a valid Weight";
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),

                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            ActionChip.elevated(
                              backgroundColor:
                                  Color.fromARGB(255, 61, 170, 184),
                              label: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Center(
                                  child: Text(
                                    local.save,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (male == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(local.genderError)));
                                    return;
                                  }
                                  // Navigator.pushReplacementNamed(context, ROUTE_HOME);
                                  // Navigator.pop(context);
                                  // widget.onSave(
                                  //   Player(
                                  //     name: nameCtl.text,
                                  //     phoneNum: phoneCtl.text,
                                  //     birthDate: birthCtl.text,
                                  //     gender:
                                  //         male as bool ? Gender.male : Gender.female,
                                  //   ),
                                  // );
                                  print("Player info screen!!");
                                  BlocProvider.of<ProfileBloc>(context).add(
                                    ProfileSubmitEvent(
                                      isCreate: isCreate,
                                      player: PlayerModel(
                                        uid: isCreate
                                            ? ""
                                            // : widget.player!.uid,
                                            : "",
                                        name: nameCtl.text,
                                        phoneNum: phoneCtl.text,
                                        birthDate: birthCtl.text,
                                        gender: male as bool
                                            ? Gender.male
                                            : Gender.female,
                                        level: 0,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (state is ProfileLoadingState)
                  Container(
                    color: const Color.fromARGB(108, 0, 0, 0),
                    child: Center(
                      child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
