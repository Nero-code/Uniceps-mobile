// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure()';
}


}

/// @nodoc
class $AuthFailureCopyWith<$Res>  {
$AuthFailureCopyWith(AuthFailure _, $Res Function(AuthFailure) __);
}


/// Adds pattern-matching-related methods to [AuthFailure].
extension AuthFailurePatterns on AuthFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AOffline value)?  aOffline,TResult Function( _InvalidEmailFailure value)?  invalidEmailFailure,TResult Function( _InvalidCodeFailure value)?  invalidCodeFailure,TResult Function( _UnautherizedFailure value)?  unautherizedFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline(_that);case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure(_that);case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure(_that);case _UnautherizedFailure() when unautherizedFailure != null:
return unautherizedFailure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AOffline value)  aOffline,required TResult Function( _InvalidEmailFailure value)  invalidEmailFailure,required TResult Function( _InvalidCodeFailure value)  invalidCodeFailure,required TResult Function( _UnautherizedFailure value)  unautherizedFailure,}){
final _that = this;
switch (_that) {
case _AOffline():
return aOffline(_that);case _InvalidEmailFailure():
return invalidEmailFailure(_that);case _InvalidCodeFailure():
return invalidCodeFailure(_that);case _UnautherizedFailure():
return unautherizedFailure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AOffline value)?  aOffline,TResult? Function( _InvalidEmailFailure value)?  invalidEmailFailure,TResult? Function( _InvalidCodeFailure value)?  invalidCodeFailure,TResult? Function( _UnautherizedFailure value)?  unautherizedFailure,}){
final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline(_that);case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure(_that);case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure(_that);case _UnautherizedFailure() when unautherizedFailure != null:
return unautherizedFailure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  aOffline,TResult Function()?  invalidEmailFailure,TResult Function()?  invalidCodeFailure,TResult Function()?  unautherizedFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline();case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure();case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure();case _UnautherizedFailure() when unautherizedFailure != null:
return unautherizedFailure();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  aOffline,required TResult Function()  invalidEmailFailure,required TResult Function()  invalidCodeFailure,required TResult Function()  unautherizedFailure,}) {final _that = this;
switch (_that) {
case _AOffline():
return aOffline();case _InvalidEmailFailure():
return invalidEmailFailure();case _InvalidCodeFailure():
return invalidCodeFailure();case _UnautherizedFailure():
return unautherizedFailure();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  aOffline,TResult? Function()?  invalidEmailFailure,TResult? Function()?  invalidCodeFailure,TResult? Function()?  unautherizedFailure,}) {final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline();case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure();case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure();case _UnautherizedFailure() when unautherizedFailure != null:
return unautherizedFailure();case _:
  return null;

}
}

}

/// @nodoc


class _AOffline implements AuthFailure {
  const _AOffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.aOffline()';
}


}




/// @nodoc


class _InvalidEmailFailure implements AuthFailure {
  const _InvalidEmailFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidEmailFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.invalidEmailFailure()';
}


}




/// @nodoc


class _InvalidCodeFailure implements AuthFailure {
  const _InvalidCodeFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidCodeFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.invalidCodeFailure()';
}


}




/// @nodoc


class _UnautherizedFailure implements AuthFailure {
  const _UnautherizedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnautherizedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.unautherizedFailure()';
}


}




/// @nodoc
mixin _$MembershipFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembershipFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipFailure()';
}


}

/// @nodoc
class $MembershipFailureCopyWith<$Res>  {
$MembershipFailureCopyWith(MembershipFailure _, $Res Function(MembershipFailure) __);
}


/// Adds pattern-matching-related methods to [MembershipFailure].
extension MembershipFailurePatterns on MembershipFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MmOffline value)?  mmOffline,TResult Function( _CantGetPlan value)?  cantGetPlan,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MmOffline() when mmOffline != null:
return mmOffline(_that);case _CantGetPlan() when cantGetPlan != null:
return cantGetPlan(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MmOffline value)  mmOffline,required TResult Function( _CantGetPlan value)  cantGetPlan,}){
final _that = this;
switch (_that) {
case _MmOffline():
return mmOffline(_that);case _CantGetPlan():
return cantGetPlan(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MmOffline value)?  mmOffline,TResult? Function( _CantGetPlan value)?  cantGetPlan,}){
final _that = this;
switch (_that) {
case _MmOffline() when mmOffline != null:
return mmOffline(_that);case _CantGetPlan() when cantGetPlan != null:
return cantGetPlan(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  mmOffline,TResult Function()?  cantGetPlan,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MmOffline() when mmOffline != null:
return mmOffline();case _CantGetPlan() when cantGetPlan != null:
return cantGetPlan();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  mmOffline,required TResult Function()  cantGetPlan,}) {final _that = this;
switch (_that) {
case _MmOffline():
return mmOffline();case _CantGetPlan():
return cantGetPlan();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  mmOffline,TResult? Function()?  cantGetPlan,}) {final _that = this;
switch (_that) {
case _MmOffline() when mmOffline != null:
return mmOffline();case _CantGetPlan() when cantGetPlan != null:
return cantGetPlan();case _:
  return null;

}
}

}

/// @nodoc


class _MmOffline implements MembershipFailure {
  const _MmOffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MmOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipFailure.mmOffline()';
}


}




/// @nodoc


class _CantGetPlan implements MembershipFailure {
  const _CantGetPlan();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CantGetPlan);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MembershipFailure.cantGetPlan()';
}


}




/// @nodoc
mixin _$MeasurementFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementFailure()';
}


}

/// @nodoc
class $MeasurementFailureCopyWith<$Res>  {
$MeasurementFailureCopyWith(MeasurementFailure _, $Res Function(MeasurementFailure) __);
}


/// Adds pattern-matching-related methods to [MeasurementFailure].
extension MeasurementFailurePatterns on MeasurementFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MsOffline value)?  msOffline,TResult Function( _NoRecords value)?  noRecords,TResult Function( _MsDbFailure value)?  msDbFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MsOffline() when msOffline != null:
return msOffline(_that);case _NoRecords() when noRecords != null:
return noRecords(_that);case _MsDbFailure() when msDbFailure != null:
return msDbFailure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MsOffline value)  msOffline,required TResult Function( _NoRecords value)  noRecords,required TResult Function( _MsDbFailure value)  msDbFailure,}){
final _that = this;
switch (_that) {
case _MsOffline():
return msOffline(_that);case _NoRecords():
return noRecords(_that);case _MsDbFailure():
return msDbFailure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MsOffline value)?  msOffline,TResult? Function( _NoRecords value)?  noRecords,TResult? Function( _MsDbFailure value)?  msDbFailure,}){
final _that = this;
switch (_that) {
case _MsOffline() when msOffline != null:
return msOffline(_that);case _NoRecords() when noRecords != null:
return noRecords(_that);case _MsDbFailure() when msDbFailure != null:
return msDbFailure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  msOffline,TResult Function()?  noRecords,TResult Function()?  msDbFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MsOffline() when msOffline != null:
return msOffline();case _NoRecords() when noRecords != null:
return noRecords();case _MsDbFailure() when msDbFailure != null:
return msDbFailure();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  msOffline,required TResult Function()  noRecords,required TResult Function()  msDbFailure,}) {final _that = this;
switch (_that) {
case _MsOffline():
return msOffline();case _NoRecords():
return noRecords();case _MsDbFailure():
return msDbFailure();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  msOffline,TResult? Function()?  noRecords,TResult? Function()?  msDbFailure,}) {final _that = this;
switch (_that) {
case _MsOffline() when msOffline != null:
return msOffline();case _NoRecords() when noRecords != null:
return noRecords();case _MsDbFailure() when msDbFailure != null:
return msDbFailure();case _:
  return null;

}
}

}

/// @nodoc


class _MsOffline implements MeasurementFailure {
  const _MsOffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MsOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementFailure.msOffline()';
}


}




/// @nodoc


class _NoRecords implements MeasurementFailure {
  const _NoRecords();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoRecords);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementFailure.noRecords()';
}


}




/// @nodoc


class _MsDbFailure implements MeasurementFailure {
  const _MsDbFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MsDbFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementFailure.msDbFailure()';
}


}




/// @nodoc
mixin _$PerformanceFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerformanceFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PerformanceFailure()';
}


}

/// @nodoc
class $PerformanceFailureCopyWith<$Res>  {
$PerformanceFailureCopyWith(PerformanceFailure _, $Res Function(PerformanceFailure) __);
}


/// Adds pattern-matching-related methods to [PerformanceFailure].
extension PerformanceFailurePatterns on PerformanceFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NoValues value)?  noValues,TResult Function( _InvalidValues value)?  invalidValues,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoValues() when noValues != null:
return noValues(_that);case _InvalidValues() when invalidValues != null:
return invalidValues(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NoValues value)  noValues,required TResult Function( _InvalidValues value)  invalidValues,}){
final _that = this;
switch (_that) {
case _NoValues():
return noValues(_that);case _InvalidValues():
return invalidValues(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NoValues value)?  noValues,TResult? Function( _InvalidValues value)?  invalidValues,}){
final _that = this;
switch (_that) {
case _NoValues() when noValues != null:
return noValues(_that);case _InvalidValues() when invalidValues != null:
return invalidValues(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noValues,TResult Function()?  invalidValues,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoValues() when noValues != null:
return noValues();case _InvalidValues() when invalidValues != null:
return invalidValues();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noValues,required TResult Function()  invalidValues,}) {final _that = this;
switch (_that) {
case _NoValues():
return noValues();case _InvalidValues():
return invalidValues();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noValues,TResult? Function()?  invalidValues,}) {final _that = this;
switch (_that) {
case _NoValues() when noValues != null:
return noValues();case _InvalidValues() when invalidValues != null:
return invalidValues();case _:
  return null;

}
}

}

/// @nodoc


class _NoValues implements PerformanceFailure {
  const _NoValues();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoValues);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PerformanceFailure.noValues()';
}


}




/// @nodoc


class _InvalidValues implements PerformanceFailure {
  const _InvalidValues();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidValues);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PerformanceFailure.invalidValues()';
}


}




/// @nodoc
mixin _$FileParseFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileParseFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileParseFailure()';
}


}

/// @nodoc
class $FileParseFailureCopyWith<$Res>  {
$FileParseFailureCopyWith(FileParseFailure _, $Res Function(FileParseFailure) __);
}


/// Adds pattern-matching-related methods to [FileParseFailure].
extension FileParseFailurePatterns on FileParseFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FOffline value)?  fOffline,TResult Function( _NoFileSelected value)?  noFileSelected,TResult Function( _UnsupportedVersion value)?  unsupportedVersion,TResult Function( _ParserMismatch value)?  parserMismatch,TResult Function( _CorruptedFile value)?  corruptedFile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FOffline() when fOffline != null:
return fOffline(_that);case _NoFileSelected() when noFileSelected != null:
return noFileSelected(_that);case _UnsupportedVersion() when unsupportedVersion != null:
return unsupportedVersion(_that);case _ParserMismatch() when parserMismatch != null:
return parserMismatch(_that);case _CorruptedFile() when corruptedFile != null:
return corruptedFile(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FOffline value)  fOffline,required TResult Function( _NoFileSelected value)  noFileSelected,required TResult Function( _UnsupportedVersion value)  unsupportedVersion,required TResult Function( _ParserMismatch value)  parserMismatch,required TResult Function( _CorruptedFile value)  corruptedFile,}){
final _that = this;
switch (_that) {
case _FOffline():
return fOffline(_that);case _NoFileSelected():
return noFileSelected(_that);case _UnsupportedVersion():
return unsupportedVersion(_that);case _ParserMismatch():
return parserMismatch(_that);case _CorruptedFile():
return corruptedFile(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FOffline value)?  fOffline,TResult? Function( _NoFileSelected value)?  noFileSelected,TResult? Function( _UnsupportedVersion value)?  unsupportedVersion,TResult? Function( _ParserMismatch value)?  parserMismatch,TResult? Function( _CorruptedFile value)?  corruptedFile,}){
final _that = this;
switch (_that) {
case _FOffline() when fOffline != null:
return fOffline(_that);case _NoFileSelected() when noFileSelected != null:
return noFileSelected(_that);case _UnsupportedVersion() when unsupportedVersion != null:
return unsupportedVersion(_that);case _ParserMismatch() when parserMismatch != null:
return parserMismatch(_that);case _CorruptedFile() when corruptedFile != null:
return corruptedFile(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fOffline,TResult Function()?  noFileSelected,TResult Function()?  unsupportedVersion,TResult Function()?  parserMismatch,TResult Function()?  corruptedFile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FOffline() when fOffline != null:
return fOffline();case _NoFileSelected() when noFileSelected != null:
return noFileSelected();case _UnsupportedVersion() when unsupportedVersion != null:
return unsupportedVersion();case _ParserMismatch() when parserMismatch != null:
return parserMismatch();case _CorruptedFile() when corruptedFile != null:
return corruptedFile();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fOffline,required TResult Function()  noFileSelected,required TResult Function()  unsupportedVersion,required TResult Function()  parserMismatch,required TResult Function()  corruptedFile,}) {final _that = this;
switch (_that) {
case _FOffline():
return fOffline();case _NoFileSelected():
return noFileSelected();case _UnsupportedVersion():
return unsupportedVersion();case _ParserMismatch():
return parserMismatch();case _CorruptedFile():
return corruptedFile();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fOffline,TResult? Function()?  noFileSelected,TResult? Function()?  unsupportedVersion,TResult? Function()?  parserMismatch,TResult? Function()?  corruptedFile,}) {final _that = this;
switch (_that) {
case _FOffline() when fOffline != null:
return fOffline();case _NoFileSelected() when noFileSelected != null:
return noFileSelected();case _UnsupportedVersion() when unsupportedVersion != null:
return unsupportedVersion();case _ParserMismatch() when parserMismatch != null:
return parserMismatch();case _CorruptedFile() when corruptedFile != null:
return corruptedFile();case _:
  return null;

}
}

}

/// @nodoc


class _FOffline implements FileParseFailure {
  const _FOffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileParseFailure.fOffline()';
}


}




/// @nodoc


class _NoFileSelected implements FileParseFailure {
  const _NoFileSelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoFileSelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileParseFailure.noFileSelected()';
}


}




/// @nodoc


class _UnsupportedVersion implements FileParseFailure {
  const _UnsupportedVersion();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnsupportedVersion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileParseFailure.unsupportedVersion()';
}


}




/// @nodoc


class _ParserMismatch implements FileParseFailure {
  const _ParserMismatch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParserMismatch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileParseFailure.parserMismatch()';
}


}




/// @nodoc


class _CorruptedFile implements FileParseFailure {
  const _CorruptedFile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorruptedFile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileParseFailure.corruptedFile()';
}


}




// dart format on
