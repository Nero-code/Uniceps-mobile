import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FileHelper {
  static const String profileImageName = 'profile_pic.png';

  /// Saves raw PNG bytes directly into the application's internal documents directory.
  /// Overwrites the existing profile picture if it's already there.
  static Future<String> saveToInternalStorage(Uint8List pngBytes) async {
    try {
      // 1. Get the safe app-specific local sandbox directory
      final Directory appDocDir = await getApplicationDocumentsDirectory();

      // 2. Build the absolute destination path cleanly
      final String destinationPath = p.join(appDocDir.path, profileImageName);
      final File targetFile = File(destinationPath);

      // 3. Write the bytes directly to the target file location
      // Using flush: true ensures the data is written fully to disk immediately
      final File newFile = await targetFile.writeAsBytes(pngBytes, flush: true);

      return newFile.path;
    } catch (e) {
      throw Exception("Failed to save profile image to internal storage: $e");
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
