import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'gym_qr_state.dart';
part 'gym_qr_cubit.freezed.dart';

class GymQrCubit extends Cubit<GymQrState> {
  final SharedPreferences _prefs;
  GymQrCubit({required SharedPreferences prefs})
      : _prefs = prefs,
        super(const GymQrState.initial());

  void getQr() async {
    emit(const GymQrState.loading());

    final qr = _prefs.getString('QrPin');
    emit(GymQrState.loaded(qr ?? ''));
  }

  void saveQr(String qr) async {
    emit(const GymQrState.loading());
    await _prefs.setString('QrPin', qr);
    emit(GymQrState.loaded(qr));
  }
}
