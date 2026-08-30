import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/routine_classes/premade_routine.dart';
import 'package:uniceps/app/domain/contracts/routine/i_routine_with_heat_contract.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/errors/failure.dart';

part 'premade_routines_cubit.freezed.dart';
part 'premade_routines_state.dart';

class PremadeRoutinesCubit extends Cubit<PremadeRoutinesState> {
  final IRoutineWithHeatContract _repo;
  PremadeRoutinesCubit({required IRoutineWithHeatContract repo})
    : _repo = repo,
      super(const PremadeRoutinesState.initial());

  Future<void> getPremadeRoutines(Gender gender, {String languageCode = 'en'}) async {
    final either = await _repo.getPremadeRoutines(gender, languageCode);
    either.fold((l) => emit(.failure(failure: l)), (r) => emit(.success(premade: r)));
  }

  Future<Either<PremadeFailure, Unit>> downloadAndAddRoutine(String apiId, {String languageCode = 'en'}) async {
    return await _repo.downloadAndAddRoutine(apiId, languageCode);
  }
}
