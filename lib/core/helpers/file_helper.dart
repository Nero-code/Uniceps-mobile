import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FileHelper {
  static const String profileFolderName = 'profile_data';
  static const String profileImageName = 'profile_pic.png';

  static Future<Uint8List?> getProfileImage() async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String filePath = p.join(appDocDir.path, profileFolderName, profileImageName);
      final File file = File(filePath);

      if (await file.exists()) {
        return await file.readAsBytes();
      }
      return null;
    } catch (e) {
      print("Error reading profile image: $e");
      return null;
    }
  }

  /// Saves raw PNG bytes directly into the application's internal documents directory.
  /// Overwrites the existing profile picture if it's already there.
  static Future<String> saveProfileImage(Uint8List pngBytes) async {
    try {
      // 1. Get the safe app-specific local sandbox directory
      final Directory appDocDir = await getApplicationDocumentsDirectory();

      // 2. Create dedicated folder if it doesn't exist
      final String folderPath = p.join(appDocDir.path, profileFolderName);
      await Directory(folderPath).create(recursive: true);

      // 3. Build the absolute destination path cleanly
      final String destinationPath = p.join(folderPath, profileImageName);
      final File targetFile = File(destinationPath);

      // 4. Write the bytes directly to the target file location
      // Using flush: true ensures the data is written fully to disk immediately
      final File newFile = await targetFile.writeAsBytes(pngBytes, flush: true);

      return newFile.path;
    } catch (e) {
      throw Exception("Failed to save profile image to internal storage: $e");
    }
  }

  /// Deletes the profile image if it exists.
  static Future<void> deleteProfileImage() async {
    try {
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String filePath = p.join(appDocDir.path, profileFolderName, profileImageName);
      final File file = File(filePath);

      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      throw Exception("Failed to delete profile image: $e");
    }
  }

  /// Deletes a file safely from internal storage if it exists.
  static Future<void> deleteFromInternalStorage(String sourcePath) async {
    try {
      final File sourceFile = File(sourcePath);

      if (await sourceFile.exists()) {
        await sourceFile.delete();
      } else {
        print("Notice: File deletion skipped because no file existed at $sourcePath");
      }
    } catch (e) {
      throw Exception("Failed to delete file from internal storage: $e");
    }
  }
}
