// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/presentation/blocs/authentication/auth_bloc.dart';
import 'package:uniceps/app/presentation/auth(old)/widgets/gender_selection_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/blocs/profile/profile_bloc.dart';
import 'package:uniceps/app/presentation/screens/profile/settings/widgets/profile_back_circle.dart';

class PlayerInfoScreen extends StatefulWidget {
  const PlayerInfoScreen({super.key, this.player});

  final Player? player;

  @override
  State<PlayerInfoScreen> createState() => _PlayerInfoScreenState();
}

class _PlayerInfoScreenState extends State<PlayerInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtl = TextEditingController();
  final phoneCtl = TextEditingController();
  final birthCtl = TextEditingController();

  String email = '';

  @override
  void initState() {
    super.initState();
  }

  bool? male, initial;

  bool isCreate = true, showBackBtn = false;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (context.mounted) Navigator.pop(context, false);
      },
      child: Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSubmittedState) {
              Navigator.pop(context, true);
              return;
            }
          },
          builder: (context, state) {
            if (state is ProfileLoadedState) {
              _fillProfileData(state);
            }
            return Stack(
              children: [
                if (isCreate)
                  Positioned(
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                Positioned(
                  top: 0.0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CustomPaint(painter: ProfileBackgroundCircle()),
                ),
                SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ///
                            ///   E M A I L   T E X T
                            ///
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.13,
                              child: Center(
                                child: Text(
                                  state is ProfileLoadedState
                                      ? state.player.email
                                      : "",
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                            ),

                            ///
                            ///   A P P   L O G O
                            ///
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.surface,
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

                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            ActionChip.elevated(
                              backgroundColor:
                                  const Color.fromARGB(255, 61, 170, 184),
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (!await InternetConnectionChecker()
                                      .hasConnection) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red.shade300,
                                        content: ErrorScreenWidget(
                                            f: NoInternetConnectionFailure(
                                                errMsg: ""),
                                            callback: null),
                                      ),
                                    );
                                    return;
                                  }
                                  if (male == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(local.genderError)));
                                    return;
                                  }
                                  if (state is ProfileLoadedState) {
                                    if (nameCtl.text == state.player.name &&
                                        birthCtl.text ==
                                            state.player.birthDate &&
                                        phoneCtl.text ==
                                            state.player.phoneNum &&
                                        initial == male) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text(local.nothingChanged)));

                                      return;
                                    }
                                  }
                                  if (email == "uniceps@test.com") {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(local.guestModeEditErr),
                                      ),
                                    );
                                    return;
                                  }
                                  BlocProvider.of<ProfileBloc>(context).add(
                                    ProfileSubmitEvent(
                                      isCreate: isCreate,
                                      player: PlayerModel(
                                        uid: "",
                                        name: nameCtl.text,
                                        phoneNum: phoneCtl.text,
                                        birthDate: birthCtl.text,
                                        gender: male as bool
                                            ? Gender.male
                                            : Gender.female,
                                        level: 0.0,
                                        email: "",
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            if (!isCreate)
                              ActionChip.elevated(
                                label: Text(
                                  local.deleteBtn,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                                backgroundColor: Colors.red.shade100,
                                onPressed: () async {
                                  await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(local.deleteAccount),
                                      content: Text(local.deleteAccountContent),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context, false);
                                          },
                                          child: Text(local.cancel),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (email == "uniceps@test.com") {
                                              ScaffoldMessenger.of(context)
                                                  .clearSnackBars();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      local.guestModeEditErr),
                                                ),
                                              );
                                              Navigator.pop(context);
                                              return;
                                            }
                                            BlocProvider.of<AuthBloc>(context)
                                                .add(DeleteAccountEvent());
                                            final bloc =
                                                await BlocProvider.of<AuthBloc>(
                                                        context)
                                                    .stream
                                                    .skip(1)
                                                    .first;

                                            debugPrint("${bloc.runtimeType}");
                                            if (bloc
                                                is AuthDeletedAccountState) {
                                              debugPrint("Account Deleted");
                                              BlocProvider.of<AuthBloc>(context)
                                                  .add(AuthCheckEvent());
                                              while (
                                                  Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                              }
                                              Navigator.pushReplacementNamed(
                                                  context, ROUTE_AUTH);
                                            } else {
                                              Navigator.pop(context, false);
                                            }
                                          },
                                          child: Text(
                                            local.ok,
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
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
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const CircularProgressIndicator()),
                    ),
                  ),
                if (showBackBtn)
                  Positioned(
                    top: 30.0,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _fillProfileData(ProfileLoadedState state) {
    {
      isCreate = false;
      showBackBtn = true;
      email = state.player.email;
      nameCtl.text = state.player.name;
      phoneCtl.text = state.player.phoneNum;
      birthCtl.text = state.player.birthDate;
      male = state.player.gender == Gender.male;
      initial = male;
    }
  }
}
