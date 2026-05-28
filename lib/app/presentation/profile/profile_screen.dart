import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/domain/classes/auth_entities/profile.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/app/presentation/blocs/profile/profile_cubit.dart';
import 'package:uniceps/app/presentation/profile/screens/photo_edit_screen.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/app_dialog.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile? profile;

  var isFirstLoad = true;
  bool loadingDialogActive = false;

  Future<void> _pickImage() async {
    context.read<ProfileCubit>().getProfile();
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      if (mounted) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<ProfileCubit>(),
              child: PhotoEditScreen(imagePath: result.files.single.path!),
            ),
          ),
        );
      }
    }
  }

  Future<void> _removeImage(AppLocalizations locale) async {
    return showDialog(
      context: context,
      builder: (context) => AppDialog(
        type: .delete,
        title: '${locale.delete} ${locale.profilePhoto}',
        onConfirm: () async {
          if (profile != null) {
            context.read<ProfileCubit>().deleteProfilePic(profile!);
          }
        },
      ),
    );
  }

  void _showNameDialog(String? name, AppLocalizations locale) {
    AppDialog.show(
      context: context,
      type: DialogActionType.edit,
      title: locale.pName,
      initialText: name,
      isTextField: true,
      onConfirmText: (val) {
        if (profile != null) {
          context.read<ProfileCubit>().saveProfile(profile!.copyWith(name: val));
        }
      },
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
            if (profile != null) {
              context.read<ProfileCubit>().saveProfile(profile!.copyWith(gender: val));
            }

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
    // final goal = context.read<AppConfigCubit>().state.config.goal;
    // final activityLevel = context.read<AppConfigCubit>().state.config.activityLevel;

    return Scaffold(
      appBar: AppBar(title: Text(locale.profile)),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              if (!loadingDialogActive) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const LoadingIndicator(elevated: false),
                );
                loadingDialogActive = true;
              }
            },
            loaded: (_) {
              if (loadingDialogActive) {
                Navigator.pop(context);
                loadingDialogActive = false;
              }
            },
            error: (f) {
              if (loadingDialogActive) {
                Navigator.pop(context);
                loadingDialogActive = false;
              }
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(locale.errNoInternet), backgroundColor: Colors.red));
            },
          );
        },
        buildWhen: (_, current) => current.maybeWhen(orElse: () => false, loaded: (_) => true),
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            loaded: (p) {
              profile = p;
              return SingleChildScrollView(
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
                            backgroundImage: p.photo != null ? MemoryImage(p.photo!) : null,
                            child: p.photo == null ? const Icon(Icons.person, size: 60, color: Colors.grey) : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor.withAlpha(50),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.camera_alt, color: Theme.of(context).primaryColor, size: 20),
                              ),
                            ),
                          ),
                          if (p.photo != null)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: GestureDetector(
                                onTap: () => _removeImage(locale),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: Colors.red.withAlpha(50), shape: BoxShape.circle),
                                  child: const Icon(Icons.delete, color: Colors.red, size: 20),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<AccountCubit, AccountState>(
                      builder: (context, state) {
                        return Text(
                          state.maybeWhen(orElse: () => 'john.doe@gmail.com', hasAccount: (a) => a.email),
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        );
                      },
                    ),

                    ///
                    ///  L I S T   T I L E S
                    ///
                    _buildProfileTile(
                      icon: Icons.person_outline,
                      title: locale.pName,
                      subtitle: p.name,
                      onTap: () => _showNameDialog(p.name, locale),
                    ),
                    _buildProfileTile(
                      icon: Icons.wc_outlined,
                      title: locale.gender,
                      subtitle: p.gender == Gender.male ? locale.male : locale.female,
                      onTap: () => _showGenderDialog(p.gender, locale),
                    ),
                    _buildProfileTile(
                      icon: Icons.cake_outlined,
                      title: locale.birthDate,
                      subtitle: DateFormat("d / M / y").format(p.birthDate),
                      onTap: () async {
                        final res = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          initialDate: p.birthDate,
                        );
                        if (res != null && profile != null && context.mounted) {
                          context.read<ProfileCubit>().saveProfile(profile!.copyWith(birthDate: res));
                        }
                      },
                    ),
                    Builder(
                      builder: (context) {
                        final goal = context.watch<AppConfigCubit>().state.config.goal;
                        return _buildProfileTile(
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
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        final activityLevel = context.watch<AppConfigCubit>().state.config.activityLevel;
                        return _buildProfileTile(
                          icon: Icons.directions_run,
                          title: locale.pActivityLevel,
                          subtitle: activityLevel != null ? _getActivityLevelLabel(activityLevel, locale) : '-',
                          onTap: () => _showActivityLevelDialog(locale),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    TextButton.icon(
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () => launchUrl(Uri.parse(ApiRoutes.deleteAccount)),
                      label: Text(locale.deleteBtn),
                      icon: const Icon(Icons.delete_forever),
                    ),
                  ],
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
