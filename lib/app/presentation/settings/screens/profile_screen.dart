import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/auth_enitites/player.dart';
import 'package:uniceps/app/presentation/settings/cubit/profile_cubit.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/core/widgets/gender_selection_widget.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameCtl = TextEditingController();
  final phoneCtl = TextEditingController();

  var gender = Gender.male;
  var birthDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(di.sl())..getProfile(),
        lazy: false,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const SizedBox(),
              loading: (_) => const LoadingIndicator(),
              error: (f) => ErrorScreenWidget(f: f.f),
              loaded: (p) {
                nameCtl.text = p.p.name;
                birthDate = p.p.birthDate;
                gender = p.p.gender;

                return Column(
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
                                if (res != null) {
                                  setState(() => birthDate = res);
                                }
                              },
                              child: Text(
                                DateFormat("d/M/y").format(birthDate),
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
                          final name = nameCtl.text;
                          if (name.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.pNameError)));
                          } else if (name == p.p.name &&
                              birthDate.isAtSameMomentAs(p.p.birthDate) &&
                              gender == p.p.gender) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.nothingChanged)));
                          } else {
                            context
                                .read<ProfileCubit>()
                                .saveProfile(Player(name: nameCtl.text, birthDate: birthDate, gender: gender));
                          }
                        },
                        child: Text(locale.save),
                      );
                    }),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
