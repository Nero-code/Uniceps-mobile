import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/data/services/unifile/file_parse_service.dart';
import 'package:uniceps/app/data/services/unifile/unifile.dart';
import 'package:uniceps/app/presentation/routine/blocs/routines_with_heat/routines_with_heat_bloc.dart';
import 'package:uniceps/app/presentation/routine/dialogs/routine_import_progress_dialog.dart';
import 'package:uniceps/core/logging/app_logger.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class FileImportScreen extends StatefulWidget {
  final String fileName;
  final String fileContent;

  const FileImportScreen({super.key, required this.fileName, required this.fileContent});

  @override
  State<FileImportScreen> createState() => _FileImportScreenState();
}

class _FileImportScreenState extends State<FileImportScreen> {
  UniFile? _uniFile;
  String? _error;

  @override
  void initState() {
    super.initState();
    _parseFile();
  }

  void _parseFile() {
    try {
      setState(() {
        _uniFile = UniFile.fromFile(widget.fileContent);
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = "$e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(locale.importRoutine)),
      body: _error != null
          ? Center(
              child: Text(locale.errFileParse, style: const TextStyle(color: Colors.red)),
            )
          : _uniFile == null
          ? const LoadingIndicator()
          : BlocConsumer<RoutinesWithHeatBloc, RoutinesWithHeatState>(
              listenWhen: (previous, current) => previous.maybeWhen(
                initial: () => current.maybeWhen(importing: (_) => true, orElse: () => false),
                orElse: () => false,
              ),
              listener: (context, state) {
                state.maybeWhen(
                  importing: (_) async {
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => BlocProvider.value(
                        value: context.read<RoutinesWithHeatBloc>(),
                        child: const RoutineImportProgressDialog(),
                      ),
                    );
                    if (context.mounted) Navigator.pop(context);
                  },
                  loaded: (_) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(locale.done)));
                  },
                  error: (f) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(locale.errNoInternet), backgroundColor: Colors.red));
                  },
                  orElse: () => logger.e(state.runtimeType),
                );
              },
              buildWhen: (p, c) => c.maybeWhen(importing: (_) => false, orElse: () => true),
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoTile(context, locale.fileName, widget.fileName),
                      _buildInfoTile(context, locale.source, _uniFile!.meta.source),
                      _buildInfoTile(context, locale.fileType, _uniFile!.meta.fileType.title),
                      _buildInfoTile(context, locale.schemaVersion, _uniFile!.meta.schemaVersion.toString()),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (_uniFile!.meta.fileType == FileType.routine &&
                                _uniFile!.meta.schemaVersion == UniFileManager.supportedVersion) {
                              context.read<RoutinesWithHeatBloc>().add(RoutinesWithHeatEvent.importUniFile(_uniFile!));
                            } else {
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(SnackBar(content: Text(locale.errUnsupportedFileType)));
                            }
                          },
                          icon: const Icon(Icons.download),
                          label: Text(locale.importRoutine),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildInfoTile(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const Divider(thickness: .5),
        ],
      ),
    );
  }
}
