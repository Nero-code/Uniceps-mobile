import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

// import 'package:file_selector/file_selector.dart';
import 'package:file_picker/file_picker.dart' as f;
import 'package:file_saver/file_saver.dart';
import 'package:logger/logger.dart';
import 'package:uniceps/app/data/sources/services/import/unifile.dart';

class UniFileManager {
  static const supportedVersion = 1;
  final Logger _logger;
  const UniFileManager({required Logger logger}) : _logger = logger;

  /// Save directly to a picked directory
  // Future<String?> saveToDirectory({
  //   // required String directory,
  //   required String fileName,
  //   required Uint8List bytes,
  //   String? mimeType,
  //   bool replace = false,
  // }) async {
  //   final directory = await FlutterFileDialog.();
  //   return await FlutterFileDialog.saveFileToDirectory(
  //     directory: directory!,
  //     data: bytes,
  //     fileName: fileName,
  //     replace: replace,
  //   );
  // }

  /// Imports a .unx file using the system's file picker.
  ///
  /// Throws [NoFileSelectedException] if the user cancels the picker.
  /// Throws [CorruptedFileException] if the file cannot be read or parsed.
  /// Throws [UnsupportedException] if the file's schema version is too new.
  Future<UniFile> importFile() async {
    // 1. Open the file picker, filtering for your custom extension.
    f.FilePickerResult? result = await f.FilePicker.platform.pickFiles(
      type: f.FileType.custom,
      allowedExtensions: ['unx'], // Filter for your app's files
      allowMultiple: false, // Ensure only one file is selected
    );

    // 2. Check if the user selected a file or cancelled.
    if (result == null || result.files.single.path == null) {
      // User canceled the picker.
      throw NoFileSelectedException();
    }

    // 3. Get the File object from the result.
    final file = File(result.files.single.path!);

    UniFile? uniFile;
    try {
      // 4. Read the file contents as a string and parse it.
      final contents = await file.readAsString();
      _logger.d('File contents: $contents');
      uniFile = UniFile.fromFile(contents);
    } catch (e) {
      // This catches errors from file reading or JSON parsing.
      _logger.e("Failed to read or parse the file", error: e);
      throw CorruptedFileException();
    }

    // 5. Validate the schema version.
    if (uniFile.meta.schemaVersion > supportedVersion) {
      throw UnsupportedException();
    }

    return uniFile;
  }

  // Future<UniFile> importFile() async {
  //   const XTypeGroup typeGroup = XTypeGroup(label: 'Uniceps Files', extensions: ['unx']);
  //   final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);
  //
  //   if (file == null) throw NoFileSelectedException();
  //
  //   UniFile? uniFile;
  //   try {
  //     final bytes = await file.readAsBytes();
  //     final contents = const Utf8Decoder().convert(bytes);
  //     _logger.d('File contents: $contents');
  //     uniFile = UniFile.fromFile(contents);
  //   } catch (e) {
  //     throw CorruptedFileException();
  //   }
  //   if (uniFile.meta.schemaVersion > supportedVersion) {
  //     throw UnsupportedException();
  //   }
  //   return uniFile;
  // }

  /// Exports data to a .unx file using the system's file saver dialog.
  ///
  /// The user will be prompted to choose a location and confirm the file name.
  /// Throws [NoFileSelectedException] if the user cancels the save operation.
  Future<void> exportRoutineToFile({required String fileName, required Map<String, dynamic> data}) async {
    // 1. Create the UniFile object and convert it to its final string representation.
    final String fileContentString = UniFile(
      meta: const MetaPart(
        source: 'uniceps_app', // It's good practice to name the source
        schemaVersion: supportedVersion,
        fileType: FileType.routine,
      ),
      data: data,
    ).toFile();

    // 2. Convert the string content to a byte list (Uint8List).
    final Uint8List bytes = utf8.encode(fileContentString);

    // 3. Use file_saver to open the native "Save As..." dialog.
    // This handles all permissions and file writing for you.
    final savedPath = await FileSaver.instance.saveAs(
      name: fileName, // The default file name in the dialog
      bytes: bytes,
      fileExtension: 'unx', // The file extension
      // Use a generic MIME type to prevent the OS from adding a .txt extension.
      mimeType: MimeType.custom,
      // Use 'application/octet-stream' to force the OS to not append any extra extension.
      customMimeType: 'application/octet-stream',
    );

    // 4. Check if the user cancelled the operation.
    if (savedPath == null) {
      _logger.w("User cancelled the file export operation.");
      throw NoFileSelectedException(); // Re-use your existing exception
    }

    _logger.i("File exported successfully to: $savedPath");
  }

  // Future<void> exportRoutineToFile({required String fileName, required Map<String, dynamic> data}) async {
  //   final path = await getDirectoryPath();
  //   if (path == null) throw NoFileSelectedException();
  //
  //   int counter = 1;
  //   var file = File('$path/$fileName.unx');
  //   while (file.existsSync()) {
  //     file = File("$path/$fileName($counter).unx");
  //     counter++;
  //   }
  //
  //   final uniFile = UniFile(
  //     meta: const MetaPart(source: 'source', schemaVersion: supportedVersion, fileType: FileType.routine),
  //     data: data,
  //   ).toFile();
  //   // await saveToDirectory(fileName: fileName, bytes: utf8.encode(uniFile));
  //   await file.writeAsString(uniFile, mode: FileMode.writeOnly);
  // }
}

class ParserMismatchException implements Exception {}

class CorruptedFileException implements Exception {}

class NoFileSelectedException implements Exception {}

class UnsupportedException implements Exception {}
