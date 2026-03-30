import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/data/services/internet_client/client_helper.dart';
import 'package:uniceps/app/presentation/blocs/exercise_lib/media_downloader_cubit.dart';
import 'package:uniceps/core/constants/api_routes.dart';
import 'package:uniceps/injection_dependency.dart';

class ExerciseLibUpdateDialog extends StatelessWidget {
  const ExerciseLibUpdateDialog({super.key, required this.client, required this.callback});

  final ClientHelper client;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaDownloaderCubit(sl()),
      lazy: false,
      child: AlertDialog(
        icon: Icon(Icons.downloading, size: 50, color: Colors.green),
        content: FutureBuilder(
          future: client.getListHandler(
            ApiRoutes.domain,
            ApiRoutes.exercises,
            (json) => json['exerciseId'].toString(),
            needsHeader: false,
          ),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              final list = asyncSnapshot.data as List<String>;
              context.read<MediaDownloaderCubit>().downloadImages(
                list.map((e) => ApiRoutes.domain + ApiRoutes.exerciseImage(e)).toList(),
              );
              return BlocBuilder<MediaDownloaderCubit, MediaDownloaderState>(
                builder: (context, state) {
                  if (state.status == MediaDownloaderStatus.success) {
                    callback();
                    Navigator.pop(context);
                  }
                  return Column(
                    mainAxisSize: .min,
                    children: [
                      Text('${(state.progress * 100).toInt()}%'),
                      LinearProgressIndicator(value: state.progress),
                    ],
                  );
                },
              );
            } else if (asyncSnapshot.hasError) {
              print(asyncSnapshot.error);
              return Center(child: Icon(Icons.error, size: 50, color: Colors.red));
            }
            return LinearProgressIndicator();
          },
        ),
      ),
    );
  }
}
