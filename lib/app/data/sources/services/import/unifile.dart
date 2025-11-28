import 'dart:convert';

class UniFile {
  final MetaPart meta;
  final Map<String, dynamic> data;

  const UniFile({required this.meta, required this.data});

  factory UniFile.fromFile(String fileString) {
    final json = jsonDecode(fileString);
    return UniFile(meta: MetaPart.fromFile(json['Meta']), data: json['Data']);
  }
}

class MetaPart {
  final String source;
  final int schemaVersion;
  final FileType fileType;

  const MetaPart({
    required this.source,
    required this.schemaVersion,
    required this.fileType,
  });

  factory MetaPart.fromFile(Map<String, dynamic> json) => MetaPart(
      source: (json['Source'] as String),
      schemaVersion: (json['SchemaVersion'] as num).toInt(),
      fileType: FileType.values.firstWhere((f) => f.title == json['FileType'].toString()));
}

enum FileType {
  routine('Routine');

  final String title;
  const FileType(this.title);
}
