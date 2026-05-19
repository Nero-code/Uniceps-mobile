import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/data/models/auth_models/player_model.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/app/presentation/profile/cubit/profile_cubit.dart';
import 'package:uniceps/app/presentation/profile/pages/p_activity_level_page.dart';
import 'package:uniceps/app/presentation/profile/pages/p_birthdate_page.dart';
import 'package:uniceps/app/presentation/profile/pages/p_gender_page.dart';
import 'package:uniceps/app/presentation/profile/pages/p_goal_page.dart';
import 'package:uniceps/app/presentation/profile/pages/p_name_page.dart';
import 'package:uniceps/app/presentation/profile/pages/p_photo_page.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/injection_dependency.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class ProfileInitialScreen extends StatefulWidget {
  const ProfileInitialScreen({super.key});

  @override
  State<ProfileInitialScreen> createState() => _ProfileInitialScreenState();
}

class _ProfileInitialScreenState extends State<ProfileInitialScreen> {
  final PageController _pageController = PageController();
  final nameCtl = TextEditingController();
  DateTime? birthDate;
  Gender? gender;
  Goal? goal;
  ActivityLevel? activityLevel;
  String? photoPath;
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    nameCtl.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 5) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        photoPath = result.files.single.path;
      });
    }
  }

  void _removeImage() {
    setState(() {
      photoPath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => ProfileCubit(sl())..getProfile(),
      lazy: false,
      child: BlocListener<ProfileCubit, ProfileState>(
        listenWhen: (p, c) =>
            p.maybeWhen(notFound: () => true, orElse: () => false) &&
            c.maybeWhen(found: () => true, orElse: () => false),
        listener: (context, state) => Navigator.pushReplacementNamed(context, AppRoutes.home),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () => _showLanguageDialog(context, locale),
                icon: const Icon(Icons.language, color: Colors.grey),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                _buildProgressBar(),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) => setState(() => _currentPage = index),
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // _buildNamePage(locale, theme),
                      PNamePage(controller: nameCtl),
                      // _buildGenderPage(locale, theme),
                      PGenderPage(selectedGender: gender, onGenderSelected: (g) => setState(() => gender = g)),
                      // _buildBirthDatePage(locale, theme),
                      PBirthDatePage(birthDate: birthDate, onDateSelected: (bd) => setState(() => birthDate = bd)),
                      // _buildPhotoPage(locale, theme),
                      PPhotoPage(photoPath: photoPath, onPickImage: _pickImage, onRemoveImage: _removeImage),
                      // _buildGoalPage(locale, theme),
                      PGoalPage(selectedGoal: goal, onGoalSelected: (g) => setState(() => goal = g)),
                      // _buildActivityLevelPage(locale, theme),
                      PActivityLevelPage(
                        selectedLevel: activityLevel,
                        onLevelChanged: (l) => setState(() => activityLevel = l),
                      ),
                    ],
                  ),
                ),
                _buildNavigationButtons(locale),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: List.generate(6, (index) {
          return Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: index <= _currentPage ? Theme.of(context).primaryColor : Colors.grey.withAlpha(77),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNavigationButtons(AppLocalizations locale) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPage > 0)
            TextButton(onPressed: _previousPage, child: Text(locale.before))
          else
            const SizedBox.shrink(),
          Builder(
            builder: (context) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  if (_currentPage < 5) {
                    // Validate current step
                    if (_currentPage == 0 && nameCtl.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.pNameError)));
                      return;
                    }
                    if (_currentPage == 1 && gender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.genderError)));
                      return;
                    }
                    if (_currentPage == 2 && birthDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.birthDateError)));
                      return;
                    }
                    if (_currentPage == 3 && goal == null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text("Please select your goal")));
                      return;
                    }
                    if (_currentPage == 4 && activityLevel == null) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text("Please select your activity level")));
                      return;
                    }
                    _nextPage();
                  } else {
                    // Final save
                    context.read<ProfileCubit>().saveProfile(
                      PlayerModel(name: nameCtl.text.trim(), birthDate: birthDate!, gender: gender!, photo: photoPath),
                    );
                  }
                },
                child: Text(_currentPage == 5 ? locale.save : locale.next),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, AppLocalizations locale) {
    showDialog(
      context: context,
      builder: (c) {
        final languageCode = context.read<AppConfigCubit>().state.config.appLanguage.languageCode;
        return AlertDialog(
          title: Text(locale.chooseLang),
          content: RadioGroup<String>(
            groupValue: languageCode,
            onChanged: (newVal) {
              if (newVal != null) {
                context.read<AppConfigCubit>().changeAppLanguageTo(newVal);
                Navigator.pop(context);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i in Lang.values)
                  RadioListTile<String>(title: Text(i == Lang.en ? "English" : "العربية"), value: i.code),
              ],
            ),
          ),
        );
      },
    );
  }
}
