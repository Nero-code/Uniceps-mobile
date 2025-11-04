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
    required TResult Function() getPlan,
    required TResult Function(PlanItem item) buyPlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPlan,
    TResult? Function(PlanItem item)? buyPlan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPlan,
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
}

/// @nodoc
class __$$GetPlanImplCopyWithImpl<$Res>
    extends _$PlansEventCopyWithImpl<$Res, _$GetPlanImpl>
    implements _$$GetPlanImplCopyWith<$Res> {
  __$$GetPlanImplCopyWithImpl(
      _$GetPlanImpl _value, $Res Function(_$GetPlanImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPlanImpl implements _GetPlan {
  const _$GetPlanImpl();

  @override
  String toString() {
    return 'PlansEvent.getPlan()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPlanImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPlan,
    required TResult Function(PlanItem item) buyPlan,
  }) {
    return getPlan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPlan,
    TResult? Function(PlanItem item)? buyPlan,
  }) {
    return getPlan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPlan,
    TResult Function(PlanItem item)? buyPlan,
    required TResult orElse(),
  }) {
    if (getPlan != null) {
      return getPlan();
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
  const factory _GetPlan() = _$GetPlanImpl;
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
    Object? item = null,
  }) {
    return _then(_$BuyPlanImpl(
      null == item
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
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyPlanImplCopyWith<_$BuyPlanImpl> get copyWith =>
      __$$BuyPlanImplCopyWithImpl<_$BuyPlanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPlan,
    required TResult Function(PlanItem item) buyPlan,
  }) {
    return buyPlan(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPlan,
    TResult? Function(PlanItem item)? buyPlan,
  }) {
    return buyPlan?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPlan,
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
    required TResult Function() loading,
    required TResult Function(Plan p) loaded,
    required TResult Function(PaymentResponse paymentResponse) buyPlanAndReset,
    required TResult Function(Failure f) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Plan p)? loaded,
    TResult? Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult? Function(Failure f)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Plan p)? loaded,
    TResult Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult Function(Failure f)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_BuyPlanAndReset value) buyPlanAndReset,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult Function(_Error value)? error,
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
    required TResult Function() loading,
    required TResult Function(Plan p) loaded,
    required TResult Function(PaymentResponse paymentResponse) buyPlanAndReset,
    required TResult Function(Failure f) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Plan p)? loaded,
    TResult? Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult? Function(Failure f)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Plan p)? loaded,
    TResult Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult Function(Failure f)? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_BuyPlanAndReset value) buyPlanAndReset,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult Function(_Error value)? error,
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

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PlansState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Plan p) loaded,
    required TResult Function(PaymentResponse paymentResponse) buyPlanAndReset,
    required TResult Function(Failure f) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Plan p)? loaded,
    TResult? Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult? Function(Failure f)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Plan p)? loaded,
    TResult Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult Function(Failure f)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_BuyPlanAndReset value) buyPlanAndReset,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PlansState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Plan p});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p = null,
  }) {
    return _then(_$LoadedImpl(
      null == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as Plan,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.p);

  @override
  final Plan p;

  @override
  String toString() {
    return 'PlansState.loaded(p: $p)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.p, p) || other.p == p));
  }

  @override
  int get hashCode => Object.hash(runtimeType, p);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Plan p) loaded,
    required TResult Function(PaymentResponse paymentResponse) buyPlanAndReset,
    required TResult Function(Failure f) error,
  }) {
    return loaded(p);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Plan p)? loaded,
    TResult? Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult? Function(Failure f)? error,
  }) {
    return loaded?.call(p);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Plan p)? loaded,
    TResult Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult Function(Failure f)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(p);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_BuyPlanAndReset value) buyPlanAndReset,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PlansState {
  const factory _Loaded(final Plan p) = _$LoadedImpl;

  Plan get p;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuyPlanAndResetImplCopyWith<$Res> {
  factory _$$BuyPlanAndResetImplCopyWith(_$BuyPlanAndResetImpl value,
          $Res Function(_$BuyPlanAndResetImpl) then) =
      __$$BuyPlanAndResetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentResponse paymentResponse});
}

/// @nodoc
class __$$BuyPlanAndResetImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$BuyPlanAndResetImpl>
    implements _$$BuyPlanAndResetImplCopyWith<$Res> {
  __$$BuyPlanAndResetImplCopyWithImpl(
      _$BuyPlanAndResetImpl _value, $Res Function(_$BuyPlanAndResetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentResponse = null,
  }) {
    return _then(_$BuyPlanAndResetImpl(
      null == paymentResponse
          ? _value.paymentResponse
          : paymentResponse // ignore: cast_nullable_to_non_nullable
              as PaymentResponse,
    ));
  }
}

/// @nodoc

class _$BuyPlanAndResetImpl implements _BuyPlanAndReset {
  const _$BuyPlanAndResetImpl(this.paymentResponse);

  @override
  final PaymentResponse paymentResponse;

  @override
  String toString() {
    return 'PlansState.buyPlanAndReset(paymentResponse: $paymentResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyPlanAndResetImpl &&
            (identical(other.paymentResponse, paymentResponse) ||
                other.paymentResponse == paymentResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyPlanAndResetImplCopyWith<_$BuyPlanAndResetImpl> get copyWith =>
      __$$BuyPlanAndResetImplCopyWithImpl<_$BuyPlanAndResetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Plan p) loaded,
    required TResult Function(PaymentResponse paymentResponse) buyPlanAndReset,
    required TResult Function(Failure f) error,
  }) {
    return buyPlanAndReset(paymentResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Plan p)? loaded,
    TResult? Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult? Function(Failure f)? error,
  }) {
    return buyPlanAndReset?.call(paymentResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Plan p)? loaded,
    TResult Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult Function(Failure f)? error,
    required TResult orElse(),
  }) {
    if (buyPlanAndReset != null) {
      return buyPlanAndReset(paymentResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_BuyPlanAndReset value) buyPlanAndReset,
    required TResult Function(_Error value) error,
  }) {
    return buyPlanAndReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult? Function(_Error value)? error,
  }) {
    return buyPlanAndReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (buyPlanAndReset != null) {
      return buyPlanAndReset(this);
    }
    return orElse();
  }
}

abstract class _BuyPlanAndReset implements PlansState {
  const factory _BuyPlanAndReset(final PaymentResponse paymentResponse) =
      _$BuyPlanAndResetImpl;

  PaymentResponse get paymentResponse;
  @JsonKey(ignore: true)
  _$$BuyPlanAndResetImplCopyWith<_$BuyPlanAndResetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure f});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PlansStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = null,
  }) {
    return _then(_$ErrorImpl(
      null == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.f);

  @override
  final Failure f;

  @override
  String toString() {
    return 'PlansState.error(f: $f)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.f, f) || other.f == f));
  }

  @override
  int get hashCode => Object.hash(runtimeType, f);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Plan p) loaded,
    required TResult Function(PaymentResponse paymentResponse) buyPlanAndReset,
    required TResult Function(Failure f) error,
  }) {
    return error(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Plan p)? loaded,
    TResult? Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult? Function(Failure f)? error,
  }) {
    return error?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Plan p)? loaded,
    TResult Function(PaymentResponse paymentResponse)? buyPlanAndReset,
    TResult Function(Failure f)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_BuyPlanAndReset value) buyPlanAndReset,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_BuyPlanAndReset value)? buyPlanAndReset,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PlansState {
  const factory _Error(final Failure f) = _$ErrorImpl;

  Failure get f;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
