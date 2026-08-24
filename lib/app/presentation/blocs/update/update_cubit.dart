import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/core/helpers/version.dart';
import 'package:uniceps/core/helpers/version_service.dart';
import 'package:uniceps/core/logging/app_logger.dart';

part 'update_cubit.freezed.dart';
part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  final VersionService _service;
  UpdateCubit({required VersionService service}) : _service = service, super(const UpdateState.initial());

  Future<void> checkAppUpdate() async {
    final ver = await _service.checkAppUpdates();
    logger.t('Version Got From Api: ${ver.toJson()}');
    ver.build > Version.currentBuild ? emit(.needsUpdate(ver)) : emit(const .latestVersion());
  }
}
