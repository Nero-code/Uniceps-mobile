import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/practice/blocs/current_routine/last_day_state.dart';

class LastDayCubit extends Cubit<LastDayState> {
  LastDayCubit() : super(const LastDayState(lastDayId: null));

  void getLastTrainingDay() async {}
}
