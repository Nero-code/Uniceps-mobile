import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/app/presentation/profile/cubits/profile/profile_cubit.dart';
import 'package:uniceps/app/presentation/profile/screens/photo_edit_screen.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/app_dialog.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  Gender? gender;
  DateTime? birthDate;
  String? photoPath;

  var isFirstLoad = true;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      if (mounted) {
        final editedPath = await Navigator.push<String>(
          context,
          MaterialPageRoute(builder: (context) => PhotoEditScreen(imagePath: result.files.single.path!)),
        );

        if (editedPath != null) {
          setState(() {
            photoPath = editedPath;
          });
        }
      }
    }
  }

  void _showNameDialog(String? name, AppLocalizations locale) {
    AppDialog.show(
      context: context,
      type: DialogActionType.edit,
      title: locale.pName,
      initialText: name,
      isTextField: true,
      // onConfirmText: (val) => setState(() => name = val),
    );
  }

  void _showGenderDialog(Gender gender, AppLocalizations locale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(locale.gender),
        content: RadioGroup<Gender>(
          groupValue: gender,
          onChanged: (val) {
            setState(() => gender = val!);
            Navigator.pop(context);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: Gender.values
                .map(
                  (g) => RadioListTile<Gender>(title: Text(g == Gender.male ? locale.male : locale.female), value: g),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  void _showGoalDialog(AppLocalizations locale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(locale.pGoal),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: Goal.values
              .map(
                (g) => ListTile(
                  title: Text(
                    g == Goal.bulking
                        ? locale.bulking
                        : g == Goal.losingWeight
                        ? locale.losingWeight
                        : locale.maintenance,
                  ),
                  selected: context.read<AppConfigCubit>().state.config.goal == g,
                  onTap: () {
                    // setState(() => goal = g);
                    context.read<AppConfigCubit>().changeGoalTo(g);
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _showActivityLevelDialog(AppLocalizations locale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(locale.pActivityLevel),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ActivityLevel.values
                .map(
                  (a) => ListTile(
                    title: Text(_getActivityLevelLabel(a, locale)),
                    selected: context.read<AppConfigCubit>().state.config.activityLevel == a,
                    onTap: () {
                      // setState(() => activityLevel = a);
                      context.read<AppConfigCubit>().changeActivityLevelTo(a);
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  String _getActivityLevelLabel(ActivityLevel level, AppLocalizations locale) {
    switch (level) {
      case ActivityLevel.sedentary:
        return locale.sedentary;
      case ActivityLevel.lightlyActive:
        return locale.lightlyActive;
      case ActivityLevel.moderatelyActive:
        return locale.moderatelyActive;
      case ActivityLevel.veryActive:
        return locale.veryActive;
      case ActivityLevel.extraActive:
        return locale.extraActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final goal = context.read<AppConfigCubit>().state.config.goal;
    final activityLevel = context.read<AppConfigCubit>().state.config.activityLevel;

    return BlocProvider(
      create: (context) => ProfileCubit(di.sl())..getProfile(),
      lazy: false,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox(),
            loading: (_) => const LoadingIndicator(),
            error: (f) => ErrorScreenWidget(f: f.f),
            loaded: (p) {
              if (isFirstLoad) {
                name = p.p.name;
                birthDate = p.p.birthDate;
                gender = p.p.gender;
                photoPath = p.p.photo;
                // goal and activityLevel might need to be fetched from somewhere else if not in p.p
                isFirstLoad = false;
              }

              return Scaffold(
                appBar: AppBar(title: Text(locale.profile)),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      ///
                      ///  P H O T O   S E L E C T O R
                      ///
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey.withAlpha(50),
                              backgroundImage: photoPath != null ? FileImage(File(photoPath!)) : null,
                              child: photoPath == null ? const Icon(Icons.person, size: 60, color: Colors.grey) : null,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      ///
                      ///  L I S T   T I L E S
                      ///
                      _buildProfileTile(
                        icon: Icons.person_outline,
                        title: locale.pName,
                        subtitle: name ?? '',
                        onTap: () => _showNameDialog(name, locale),
                      ),
                      _buildProfileTile(
                        icon: Icons.wc_outlined,
                        title: locale.gender,
                        subtitle: gender == Gender.male ? locale.male : locale.female,
                        onTap: () => _showGenderDialog(gender ?? .male, locale),
                      ),
                      _buildProfileTile(
                        icon: Icons.cake_outlined,
                        title: locale.birthDate,
                        subtitle: DateFormat("d / M / y").format(birthDate ?? DateTime.now()),
                        onTap: () async {
                          final res = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            initialDate: birthDate ?? DateTime.now(),
                          );
                          if (res != null) setState(() => birthDate = res);
                        },
                      ),
                      _buildProfileTile(
                        icon: Icons.track_changes,
                        title: locale.pGoal,
                        subtitle: goal == Goal.bulking
                            ? locale.bulking
                            : goal == Goal.losingWeight
                            ? locale.losingWeight
                            : goal == Goal.maintenance
                            ? locale.maintenance
                            : '-',
                        onTap: () => _showGoalDialog(locale),
                      ),
                      _buildProfileTile(
                        icon: Icons.directions_run,
                        title: locale.pActivityLevel,
                        subtitle: activityLevel != null ? _getActivityLevelLabel(activityLevel, locale) : '-',
                        onTap: () => _showActivityLevelDialog(locale),
                      ),

                      const SizedBox(height: 40),
                      TextButton.icon(
                        style: TextButton.styleFrom(foregroundColor: Colors.red),
                        onPressed: () => launchUrl(Uri.parse(ApiRoutes.deleteAccount)),
                        label: Text(locale.deleteBtn),
                        icon: const Icon(Icons.delete_forever),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: onTap,
    );
  }
}
