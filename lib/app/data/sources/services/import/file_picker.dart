import 'package:file_selector/file_selector.dart';

class FilePicker {
  Future<XFile?> importFile() async {
    const XTypeGroup typeGroup = XTypeGroup(label: 'documents', extensions: ['uni']);
    final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);
    return file;
  }
}
