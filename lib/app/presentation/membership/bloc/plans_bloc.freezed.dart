// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlansEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Plan plan) getPlan,
    required TResult Function(PlanItem item) buyPlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Plan plan)? getPlan,
    TResult? Function(PlanItem item)? buyPlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Plan plan)? getPlan,
    TResult Function(PlanItem item)? buyPlan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPlan value) getPlan,
    required TResult Function(_BuyPlan value) buyPlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPlan value)? getPlan,
    TResult? Function(_BuyPlan value)? buyPlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPlan value)? getPlan,
    TResult Function(_BuyPlan value)? buyPlan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansEventCopyWith<$Res> {
  factory $PlansEventCopyWith(
          PlansEvent value, $Res Function(PlansEvent) then) =
      _$PlansEventCopyWithImpl<$Res, PlansEvent>;
}

/// @nodoc
class _$PlansEventCopyWithImpl<$Res, $Val extends PlansEvent>
    implements $PlansEventCopyWith<$Res> {
  _$PlansEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetPlanImplCopyWith<$Res> {
  factory _$$GetPlanImplCopyWith(
          _$GetPlanImpl value, $Res Function(_$GetPlanImpl) then) =
      __$$GetPlanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Plan plan});
}

/// @nodoc
class __$$GetPlanImplCopyWithImpl<$Res>
    extends _$PlansEventCopyWithImpl<$Res, _$GetPlanImpl>
    implements _$$GetPlanImplCopyWith<$Res> {
  __$$GetPlanImplCopyWithImpl(
      _$GetPlanImpl _value, $Res Function(_$GetPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = freezed,
  }) {
    return _then(_$GetPlanImpl(
      freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as Plan,
    ));
  }
}

/// @nodoc

class _$GetPlanImpl implements _GetPlan {
  const _$GetPlanImpl(this.plan);

  @override
  final Plan plan;

  @override
  String toString() {
    return 'PlansEvent.getPlan(plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPlanImpl &&
            const DeepCollectionEquality().equals(other.plan, plan));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(plan));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPlanImplCopyWith<_$GetPlanImpl> get copyWith =>
      __$$GetPlanImplCopyWithImpl<_$GetPlanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Plan plan) getPlan,
    required TResult Function(PlanItem item) buyPlan,
  }) {
    return getPlan(plan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Plan plan)? getPlan,
    TResult? Function(PlanItem item)? buyPlan,
  }) {
    return getPlan?.call(plan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Plan plan)? getPlan,
    TResult Function(PlanItem item)? buyPlan,
    required TResult orElse(),
  }) {
    if (getPlan != null) {
      return getPlan(plan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPlan value) getPlan,
    required TResult Function(_BuyPlan value) buyPlan,
  }) {
    return getPlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPlan value)? getPlan,
    TResult? Function(_BuyPlan value)? buyPlan,
  }) {
    return getPlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPlan value)? getPlan,
    TResult Function(_BuyPlan value)? buyPlan,
    required TResult orElse(),
  }) {
    if (getPlan != null) {
      return getPlan(this);
    }
    return orElse();
  }
}

abstract class _GetPlan implements PlansEvent {
  const factory _GetPlan(final Plan plan) = _$GetPlanImpl;

  Plan get plan;
  @JsonKey(ignore: true)
  _$$GetPlanImplCopyWith<_$GetPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuyPlanImplCopyWith<$Res> {
  factory _$$BuyPlanImplCopyWith(
          _$BuyPlanImpl value, $Res Function(_$BuyPlanImpl) then) =
      __$$BuyPlanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlanItem item});
}

/// @nodoc
class __$$BuyPlanImplCopyWithImpl<$Res>
    extends _$PlansEventCopyWithImpl<$Res, _$BuyPlanImpl>
    implements _$$BuyPlanImplCopyWith<$Res> {
  __$$BuyPlanImplCopyWithImpl(
      _$BuyPlanImpl _value, $Res Function(_$BuyPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$BuyPlanImpl(
      freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PlanItem,
    ));
  }
}

/// @nodoc

class _$BuyPlanImpl implements _BuyPlan {
  const _$BuyPlanImpl(this.item);

  @override
  final PlanItem item;

  @override
  String toString() {
    return 'PlansEvent.buyPlan(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyPlanImpl &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyPlanImplCopyWith<_$BuyPlanImpl> get copyWith =>
      __$$BuyPlanImplCopyWithImpl<_$BuyPlanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Plan plan) getPlan,
    required TResult Function(PlanItem item) buyPlan,
  }) {
    return buyPlan(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Plan plan)? getPlan,
    TResult? Function(PlanItem item)? buyPlan,
  }) {
    return buyPlan?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Plan plan)? getPlan,
    TResult Function(PlanItem item)? buyPlan,
    required TResult orElse(),
  }) {
    if (buyPlan != null) {
      return buyPlan(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPlan value) getPlan,
    required TResult Function(_BuyPlan value) buyPlan,
  }) {
    return buyPlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPlan value)? getPlan,
    TResult? Function(_BuyPlan value)? buyPlan,
  }) {
    return buyPlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPlan value)? getPlan,
    TResult Function(_BuyPlan value)? buyPlan,
    required TResult orElse(),
  }) {
    if (buyPlan != null) {
      return buyPlan(this);
    }
    return orElse();
  }
}

abstract class _BuyPlan implements PlansEvent {
  const factory _BuyPlan(final PlanItem item) = _$BuyPlanImpl;

  PlanItem get item;
  @JsonKey(ignore: true)
  _$$BuyPlanImplCopyWith<_$BuyPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlansState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansStateCopyWith<$Res> {
  factory $PlansStateCopyWith(
          PlansState value, $Res Function(PlansState) then) =
      _$PlansStateCopyWithImpl<$Res, PlansState>;
}

/// @nodoc
class _$PlansStateCopyWithImpl<$Res, $Val extends PlansState>
    implements $PlansStateCopyWith<$Res> {
  _$PlansStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PlansState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlansState {
  const factory _Initial() = _$InitialImpl;
}
