import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/core/helpers/image_cache_manager.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final ImageCacheManager manager;
  ProgressBloc(this.manager) : super(ProgressInitial(-1)) {
    on<ProgressEvent>((event, emit) {
      manager.loadingBar.stream.listen((event) => emit(ProgressUpdated(event)));
    });
  }
}
