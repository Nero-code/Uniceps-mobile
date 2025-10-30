import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan.dart';
import 'package:uniceps/app/domain/classes/account_entities/plan_item.dart';

part 'plans_event.dart';
part 'plans_state.dart';
part 'plans_bloc.freezed.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  PlansBloc() : super(_Initial()) {
    on<PlansEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
