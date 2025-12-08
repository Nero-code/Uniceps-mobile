import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:uniceps/app/presentation/profile/cubit/profile_cubit.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/widgets/gender_selection_widget.dart';
import 'package:uniceps/core/constants/constants.dart';import 'package:uniceps/l10n/app_localizations.dart';
import 'package:uniceps/injection_dependency.dart';

class ProfileInitialScreen extends StatefulWidget {
  const ProfileInitialScreen({super.key});

  @override
  State<ProfileInitialScreen> createState() => _ProfileInitialScreenState();
}

class _ProfileInitialScreenState extends State<ProfileInitialScreen> {
  final nameCtl = TextEditingController();
  final phoneCtl = TextEditingController();
  DateTime? birthDate;
  Gender? gender;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => ProfileCubit(sl())..getProfile(),
      lazy: false,
      child: BlocListener<ProfileCubit, ProfileState>(
        listenWhen: (p, c) =>
            p.maybeWhen(
              notFound: () => true,
              orElse: () => false,
            ) &&
            c.maybeWhen(
              found: () => true,
              orElse: () => false,
            ),
        listener: (context, state) => Navigator.pushReplacementNamed(context, AppRoutes.home),
        child: Scaffold(
            body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0.0,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (c) {
                          final languageCode = context.read<LocaleCubit>().state.locale.languageCode;
                          return AlertDialog(
                            title: Text(locale.chooseLang),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var i in Lang.values)
                                  RadioListTile(
                                      title: Text(i == Lang.en ? "English" : "العربية"),
                                      value: languageCode == i.name,
                                      groupValue: true,
                                      onChanged: (newVal) {
                                        context.read<LocaleCubit>().changeLanguage(i.name == "en" ? "en" : "ar");
                                        Navigator.pop(context);
                                      }),
                              ],
                            ),
                          ).build(context);
                        },
                      );
                    },
                    icon: const Icon(Icons.language),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),

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
                    Text(locale.profileTitle, style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),

                    ///
                    ///  N A M E
                    ///
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .75,
                      child: TextField(
                        controller: nameCtl,
                        decoration: InputDecoration(
                          labelText: locale.pName,
                          isDense: true,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    ///
                    ///  G E N D E R   A N D   B I R T H D A T E
                    ///

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GenderSelectBox(onSelect: (isMale) => gender = (isMale ? Gender.male : Gender.female)),
                        Column(
                          children: [
                            Text(locale.birthDate),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 238, 238, 238),
                                foregroundColor: Colors.black54,
                              ),
                              onPressed: () async {
                                final res = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                setState(() => birthDate = res);
                              },
                              child: Text(
                                DateFormat("d/M/y").format(birthDate ?? DateTime.now()),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          if (nameCtl.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.pNameError)));
                          } else if (birthDate == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.birthDateError)));
                          } else if (gender == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.genderError)));
                          } else {
                            context
                                .read<ProfileCubit>()
                                .saveProfile(PlayerModel(name: nameCtl.text, birthDate: birthDate!, gender: gender!));
                          }
                        },
                        child: Text(locale.save),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
