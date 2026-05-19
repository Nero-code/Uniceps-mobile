import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class PPhotoPage extends StatelessWidget {
  final String? photoPath;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  const PPhotoPage({super.key, required this.photoPath, required this.onPickImage, required this.onRemoveImage});

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
            Icon(Icons.add_a_photo_outlined, size: 80, color: theme.primaryColor),
            const SizedBox(height: 24),
            Text(
              locale.profilePhoto,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              locale.pPhotoDescription,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: onPickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.withAlpha(51),
                backgroundImage: photoPath != null ? FileImage(File(photoPath!)) : null,
                child: photoPath == null ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey) : null,
              ),
            ),
            if (photoPath != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: onPickImage, child: Text(locale.changePhoto)),
                  TextButton(
                    onPressed: onRemoveImage,
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    child: Text(locale.remove),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
