import 'dart:convert';

import 'package:file_selector/file_selector.dart';
import 'package:uniceps/app/data/models/routine_models/routine_dto.dart';
import 'package:uniceps/app/data/sources/services/import/unifile.dart';

class FileParseService {
  static const supportedVersion = 1;

  Future<UniFile> readFile() async {
    const XTypeGroup typeGroup = XTypeGroup(label: 'documents', extensions: ['uni']);

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

  Future<T> extract<T>(UniFile file, T Function(Map<String, dynamic> json) fromJson) async {
    return fromJson(file.data);
  }
}

Type fileTypeMapper(FileType type) {
  switch (type) {
    case FileType.routine:
      return RoutineDto;
    default:
      throw UnsupportedException();
  }
}

class ParserMismatchExeption implements Exception {}

class CorruptedFileException implements Exception {}

class NoFileSelectedException implements Exception {}

class UnsupportedException implements Exception {}
