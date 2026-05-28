import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PBirthDatePage extends StatelessWidget {
  final DateTime? birthDate;
  final ValueChanged<DateTime> onDateSelected;

  const PBirthDatePage({super.key, required this.birthDate, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cake, size: 80, color: theme.primaryColor),
            const SizedBox(height: 24),
            Text(
              locale.birthDate,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              locale.pBirthDateDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () async {
                final res = await showDatePicker(
                  context: context,
                  initialDate: birthDate ?? DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        // 1. Change the main color scheme (Header, Selection circle, etc.)
                        colorScheme: ColorScheme.light(
                          primary: Theme.of(context).colorScheme.primary, // Header & Selected day circle
                          onPrimary: Colors.white, // Header text color
                          onSurface: Colors.black, // Body text color (days)
                        ),
                        // // 2. Change the "OK" and "CANCEL" button colors
                        // textButtonTheme: TextButtonThemeData(
                        //   style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.secondary),
                        // ),
                        // // 3. More specific tweaks via DatePickerTheme
                        // datePickerTheme: DatePickerThemeData(
                        //   headerBackgroundColor: Theme.of(context).secondaryHeaderColor,
                        //   backgroundColor: Colors.white, // Dialog background
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        // ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (res != null) onDateSelected(res);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.primaryColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  birthDate == null ? locale.selectDate : DateFormat("d / M / y").format(birthDate!),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
