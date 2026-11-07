import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/app/data/services/media_helper.dart';
import 'package:uniceps/app/data/sources/remote/dal_routine/exercises_remote_source.dart';
import 'package:uniceps/app/presentation/routine/widgets/progress_widget.dart';
import 'package:uniceps/app/services/exercise_lib_sync_service.dart';
import 'package:uniceps/core/logging/app_logger.dart';
import 'package:uniceps/injection_dependency.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  final mediaHelper = sl<MediaHelper>();
  final exerciseRemoteS = sl<IExercisesRemoteSourceContract>();
  final exerciseSync = sl<ExerciseLibSyncService>();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .center,
          spacing: 15,
          children: [
            SizedBox(height: 50, width: screen.width),
            ElevatedButton(
              onPressed: () async {
                final keys = await mediaHelper.getImageKeys();
                final image = await mediaHelper.getImage(keys.first);
                logger.t(
                  'does image exist? ${image != null}'
                  '\n'
                  'image size = ${image != null ? NumberFormat.decimalPattern().format(image.lengthInBytes) : 0}'
                  '\n'
                  'image name: ${keys.first}'
                  '',
                );
              },
              child: const Text('check exercise images'),
            ),
            ElevatedButton(
              onPressed: () async {
                final keys = await mediaHelper.getImageKeys();
                final image = await exerciseRemoteS.getExerciseImage(keys.first);
                logger.t(
                  'image name: ${keys.first}'
                  '\n'
                  'image size = ${NumberFormat.decimalPattern().format(image.lengthInBytes)}'
                  '',
                );
              },
              child: const Text('get exercise images'),
            ),
            ElevatedButton(
              onPressed: () async {
                print('==============================');
                print(DateFormat.jms().format(DateTime.now()));
                print('==============================');
                // exerciseSync.resyncExercises();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: StreamBuilder(
                      stream: exerciseSync.resyncExercises(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.fold(
                            (l) => ProgressWidget(percent: 0, title: Text("${l}")),
                            (r) => ProgressWidget(percent: r, title: Text('')),
                          );
                        }
                        return Container(width: 50, height: 50, child: CircularProgressIndicator());
                      },
                    ),
                  ),
                );
                print('==============================');
                print(DateFormat.jms().format(DateTime.now()));
                print('==============================');
              },
              child: const Text('reSync Exercises'),
            ),
          ],
        ),
      ),
    );
  }
}
