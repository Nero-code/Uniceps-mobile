import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:uniceps/app/data/sources/services/import/unifile.dart';

class UniFileManager {
  static const supportedVersion = 1;

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

  Future<UniFile> importFile() async {
    const XTypeGroup typeGroup = XTypeGroup(label: 'Uniceps Files', extensions: ['unx']);
    final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);

    if (file == null) throw NoFileSelectedException();

    UniFile? uniFile;
    try {
      final bytes = await file.readAsBytes();
      final contents = const Utf8Decoder().convert(bytes);
      uniFile = UniFile.fromFile(contents);
    } catch (e) {
      throw CorruptedFileException();
    }
    if (uniFile.meta.schemaVersion > supportedVersion) {
      throw UnsupportedException();
    }
    return uniFile;
  }

  Future<void> exportRoutineToFile({required String fileName, required Map<String, dynamic> data}) async {
    final path = await getDirectoryPath();
    if (path == null) throw NoFileSelectedException();

    int counter = 1;
    var file = File('$path/$fileName.unx');
    while (file.existsSync()) {
      file = File("${path}/$fileName($counter).unx");
      counter++;
    }

    final unifile = UniFile(
      meta: const MetaPart(
        source: '',
        schemaVersion: supportedVersion,
        fileType: FileType.routine,
      ),
      data: data,
    ).toFile();
    // await saveToDirectory(fileName: fileName, bytes: utf8.encode(unifile));
    await file.writeAsString(unifile, mode: FileMode.writeOnly, flush: true);
  }
}

class ParserMismatchExeption implements Exception {}

class CorruptedFileException implements Exception {}

class NoFileSelectedException implements Exception {}

class UnsupportedException implements Exception {}
