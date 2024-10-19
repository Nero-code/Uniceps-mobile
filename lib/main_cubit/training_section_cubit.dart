import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'training_section_state.dart';

class TrainingSectionCubit extends Cubit<TrainingSectionLoaded> {
  TrainingSectionCubit() : super(const TrainingSectionLoaded(null));

  Future<void> cacheSection(String section) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("section", section);
    emit(TrainingSectionLoaded(section));
    // print("pref: ${pref.getString("section")}");
  }

  Future<String?> getSection() async {
    final pref = await SharedPreferences.getInstance();
    // print("${pref.getString("section")}");
    emit(TrainingSectionLoaded(pref.getString("section")));
    return pref.getString("section");
  }

  Future<void> clearSections() async {
    final s = await SharedPreferences.getInstance();
    await s.clear();
    emit(const TrainingSectionLoaded(null));
  }
}
