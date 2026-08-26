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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AOffline value)?  aOffline,TResult Function( _InvalidEmailFailure value)?  invalidEmailFailure,TResult Function( _InvalidCodeFailure value)?  invalidCodeFailure,TResult Function( _UnauthorizedFailure value)?  unauthorizedFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline(_that);case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure(_that);case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure(_that);case _UnauthorizedFailure() when unauthorizedFailure != null:
return unauthorizedFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AOffline value)  aOffline,required TResult Function( _InvalidEmailFailure value)  invalidEmailFailure,required TResult Function( _InvalidCodeFailure value)  invalidCodeFailure,required TResult Function( _UnauthorizedFailure value)  unauthorizedFailure,}){
final _that = this;
switch (_that) {
case _AOffline():
return aOffline(_that);case _InvalidEmailFailure():
return invalidEmailFailure(_that);case _InvalidCodeFailure():
return invalidCodeFailure(_that);case _UnauthorizedFailure():
return unauthorizedFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AOffline value)?  aOffline,TResult? Function( _InvalidEmailFailure value)?  invalidEmailFailure,TResult? Function( _InvalidCodeFailure value)?  invalidCodeFailure,TResult? Function( _UnauthorizedFailure value)?  unauthorizedFailure,}){
final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline(_that);case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure(_that);case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure(_that);case _UnauthorizedFailure() when unauthorizedFailure != null:
return unauthorizedFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  aOffline,TResult Function()?  invalidEmailFailure,TResult Function()?  invalidCodeFailure,TResult Function()?  unauthorizedFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline();case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure();case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure();case _UnauthorizedFailure() when unauthorizedFailure != null:
return unauthorizedFailure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  aOffline,required TResult Function()  invalidEmailFailure,required TResult Function()  invalidCodeFailure,required TResult Function()  unauthorizedFailure,}) {final _that = this;
switch (_that) {
case _AOffline():
return aOffline();case _InvalidEmailFailure():
return invalidEmailFailure();case _InvalidCodeFailure():
return invalidCodeFailure();case _UnauthorizedFailure():
return unauthorizedFailure();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  aOffline,TResult? Function()?  invalidEmailFailure,TResult? Function()?  invalidCodeFailure,TResult? Function()?  unauthorizedFailure,}) {final _that = this;
switch (_that) {
case _AOffline() when aOffline != null:
return aOffline();case _InvalidEmailFailure() when invalidEmailFailure != null:
return invalidEmailFailure();case _InvalidCodeFailure() when invalidCodeFailure != null:
return invalidCodeFailure();case _UnauthorizedFailure() when unauthorizedFailure != null:
return unauthorizedFailure();case _:
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


class _UnauthorizedFailure implements AuthFailure {
  const _UnauthorizedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnauthorizedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthFailure.unauthorizedFailure()';
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




/// @nodoc
mixin _$LibSyncFailure {

 int get currentTotalCount;
/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibSyncFailureCopyWith<LibSyncFailure> get copyWith => _$LibSyncFailureCopyWithImpl<LibSyncFailure>(this as LibSyncFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibSyncFailure&&(identical(other.currentTotalCount, currentTotalCount) || other.currentTotalCount == currentTotalCount));
}


@override
int get hashCode => Object.hash(runtimeType,currentTotalCount);

@override
String toString() {
  return 'LibSyncFailure(currentTotalCount: $currentTotalCount)';
}


}

/// @nodoc
abstract mixin class $LibSyncFailureCopyWith<$Res>  {
  factory $LibSyncFailureCopyWith(LibSyncFailure value, $Res Function(LibSyncFailure) _then) = _$LibSyncFailureCopyWithImpl;
@useResult
$Res call({
 int currentTotalCount
});




}
/// @nodoc
class _$LibSyncFailureCopyWithImpl<$Res>
    implements $LibSyncFailureCopyWith<$Res> {
  _$LibSyncFailureCopyWithImpl(this._self, this._then);

  final LibSyncFailure _self;
  final $Res Function(LibSyncFailure) _then;

/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTotalCount = null,}) {
  return _then(_self.copyWith(
currentTotalCount: null == currentTotalCount ? _self.currentTotalCount : currentTotalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LibSyncFailure].
extension LibSyncFailurePatterns on LibSyncFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LibOffline value)?  libOffline,TResult Function( _LibNotFound value)?  libNotFound,TResult Function( _LibUnknown value)?  libUnknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibOffline() when libOffline != null:
return libOffline(_that);case _LibNotFound() when libNotFound != null:
return libNotFound(_that);case _LibUnknown() when libUnknown != null:
return libUnknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LibOffline value)  libOffline,required TResult Function( _LibNotFound value)  libNotFound,required TResult Function( _LibUnknown value)  libUnknown,}){
final _that = this;
switch (_that) {
case _LibOffline():
return libOffline(_that);case _LibNotFound():
return libNotFound(_that);case _LibUnknown():
return libUnknown(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LibOffline value)?  libOffline,TResult? Function( _LibNotFound value)?  libNotFound,TResult? Function( _LibUnknown value)?  libUnknown,}){
final _that = this;
switch (_that) {
case _LibOffline() when libOffline != null:
return libOffline(_that);case _LibNotFound() when libNotFound != null:
return libNotFound(_that);case _LibUnknown() when libUnknown != null:
return libUnknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int currentTotalCount)?  libOffline,TResult Function( int currentTotalCount)?  libNotFound,TResult Function( int currentTotalCount)?  libUnknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibOffline() when libOffline != null:
return libOffline(_that.currentTotalCount);case _LibNotFound() when libNotFound != null:
return libNotFound(_that.currentTotalCount);case _LibUnknown() when libUnknown != null:
return libUnknown(_that.currentTotalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int currentTotalCount)  libOffline,required TResult Function( int currentTotalCount)  libNotFound,required TResult Function( int currentTotalCount)  libUnknown,}) {final _that = this;
switch (_that) {
case _LibOffline():
return libOffline(_that.currentTotalCount);case _LibNotFound():
return libNotFound(_that.currentTotalCount);case _LibUnknown():
return libUnknown(_that.currentTotalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int currentTotalCount)?  libOffline,TResult? Function( int currentTotalCount)?  libNotFound,TResult? Function( int currentTotalCount)?  libUnknown,}) {final _that = this;
switch (_that) {
case _LibOffline() when libOffline != null:
return libOffline(_that.currentTotalCount);case _LibNotFound() when libNotFound != null:
return libNotFound(_that.currentTotalCount);case _LibUnknown() when libUnknown != null:
return libUnknown(_that.currentTotalCount);case _:
  return null;

}
}

}

/// @nodoc


class _LibOffline implements LibSyncFailure {
  const _LibOffline({required this.currentTotalCount});
  

@override final  int currentTotalCount;

/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibOfflineCopyWith<_LibOffline> get copyWith => __$LibOfflineCopyWithImpl<_LibOffline>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibOffline&&(identical(other.currentTotalCount, currentTotalCount) || other.currentTotalCount == currentTotalCount));
}


@override
int get hashCode => Object.hash(runtimeType,currentTotalCount);

@override
String toString() {
  return 'LibSyncFailure.libOffline(currentTotalCount: $currentTotalCount)';
}


}

/// @nodoc
abstract mixin class _$LibOfflineCopyWith<$Res> implements $LibSyncFailureCopyWith<$Res> {
  factory _$LibOfflineCopyWith(_LibOffline value, $Res Function(_LibOffline) _then) = __$LibOfflineCopyWithImpl;
@override @useResult
$Res call({
 int currentTotalCount
});




}
/// @nodoc
class __$LibOfflineCopyWithImpl<$Res>
    implements _$LibOfflineCopyWith<$Res> {
  __$LibOfflineCopyWithImpl(this._self, this._then);

  final _LibOffline _self;
  final $Res Function(_LibOffline) _then;

/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTotalCount = null,}) {
  return _then(_LibOffline(
currentTotalCount: null == currentTotalCount ? _self.currentTotalCount : currentTotalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _LibNotFound implements LibSyncFailure {
  const _LibNotFound({required this.currentTotalCount});
  

@override final  int currentTotalCount;

/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibNotFoundCopyWith<_LibNotFound> get copyWith => __$LibNotFoundCopyWithImpl<_LibNotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibNotFound&&(identical(other.currentTotalCount, currentTotalCount) || other.currentTotalCount == currentTotalCount));
}


@override
int get hashCode => Object.hash(runtimeType,currentTotalCount);

@override
String toString() {
  return 'LibSyncFailure.libNotFound(currentTotalCount: $currentTotalCount)';
}


}

/// @nodoc
abstract mixin class _$LibNotFoundCopyWith<$Res> implements $LibSyncFailureCopyWith<$Res> {
  factory _$LibNotFoundCopyWith(_LibNotFound value, $Res Function(_LibNotFound) _then) = __$LibNotFoundCopyWithImpl;
@override @useResult
$Res call({
 int currentTotalCount
});




}
/// @nodoc
class __$LibNotFoundCopyWithImpl<$Res>
    implements _$LibNotFoundCopyWith<$Res> {
  __$LibNotFoundCopyWithImpl(this._self, this._then);

  final _LibNotFound _self;
  final $Res Function(_LibNotFound) _then;

/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTotalCount = null,}) {
  return _then(_LibNotFound(
currentTotalCount: null == currentTotalCount ? _self.currentTotalCount : currentTotalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _LibUnknown implements LibSyncFailure {
  const _LibUnknown({required this.currentTotalCount});
  

@override final  int currentTotalCount;

/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibUnknownCopyWith<_LibUnknown> get copyWith => __$LibUnknownCopyWithImpl<_LibUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibUnknown&&(identical(other.currentTotalCount, currentTotalCount) || other.currentTotalCount == currentTotalCount));
}


@override
int get hashCode => Object.hash(runtimeType,currentTotalCount);

@override
String toString() {
  return 'LibSyncFailure.libUnknown(currentTotalCount: $currentTotalCount)';
}


}

/// @nodoc
abstract mixin class _$LibUnknownCopyWith<$Res> implements $LibSyncFailureCopyWith<$Res> {
  factory _$LibUnknownCopyWith(_LibUnknown value, $Res Function(_LibUnknown) _then) = __$LibUnknownCopyWithImpl;
@override @useResult
$Res call({
 int currentTotalCount
});




}
/// @nodoc
class __$LibUnknownCopyWithImpl<$Res>
    implements _$LibUnknownCopyWith<$Res> {
  __$LibUnknownCopyWithImpl(this._self, this._then);

  final _LibUnknown _self;
  final $Res Function(_LibUnknown) _then;

/// Create a copy of LibSyncFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTotalCount = null,}) {
  return _then(_LibUnknown(
currentTotalCount: null == currentTotalCount ? _self.currentTotalCount : currentTotalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$IngredientFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientFailure()';
}


}

/// @nodoc
class $IngredientFailureCopyWith<$Res>  {
$IngredientFailureCopyWith(IngredientFailure _, $Res Function(IngredientFailure) __);
}


/// Adds pattern-matching-related methods to [IngredientFailure].
extension IngredientFailurePatterns on IngredientFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IOffline value)?  iOffline,TResult Function( _EmptyIngredientBucket value)?  emptyIngredientBucket,TResult Function( _IngredientDatabaseFailure value)?  databaseFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IOffline() when iOffline != null:
return iOffline(_that);case _EmptyIngredientBucket() when emptyIngredientBucket != null:
return emptyIngredientBucket(_that);case _IngredientDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IOffline value)  iOffline,required TResult Function( _EmptyIngredientBucket value)  emptyIngredientBucket,required TResult Function( _IngredientDatabaseFailure value)  databaseFailure,}){
final _that = this;
switch (_that) {
case _IOffline():
return iOffline(_that);case _EmptyIngredientBucket():
return emptyIngredientBucket(_that);case _IngredientDatabaseFailure():
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IOffline value)?  iOffline,TResult? Function( _EmptyIngredientBucket value)?  emptyIngredientBucket,TResult? Function( _IngredientDatabaseFailure value)?  databaseFailure,}){
final _that = this;
switch (_that) {
case _IOffline() when iOffline != null:
return iOffline(_that);case _EmptyIngredientBucket() when emptyIngredientBucket != null:
return emptyIngredientBucket(_that);case _IngredientDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  iOffline,TResult Function()?  emptyIngredientBucket,TResult Function( String message)?  databaseFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IOffline() when iOffline != null:
return iOffline();case _EmptyIngredientBucket() when emptyIngredientBucket != null:
return emptyIngredientBucket();case _IngredientDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  iOffline,required TResult Function()  emptyIngredientBucket,required TResult Function( String message)  databaseFailure,}) {final _that = this;
switch (_that) {
case _IOffline():
return iOffline();case _EmptyIngredientBucket():
return emptyIngredientBucket();case _IngredientDatabaseFailure():
return databaseFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  iOffline,TResult? Function()?  emptyIngredientBucket,TResult? Function( String message)?  databaseFailure,}) {final _that = this;
switch (_that) {
case _IOffline() when iOffline != null:
return iOffline();case _EmptyIngredientBucket() when emptyIngredientBucket != null:
return emptyIngredientBucket();case _IngredientDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _IOffline implements IngredientFailure {
  const _IOffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientFailure.iOffline()';
}


}




/// @nodoc


class _EmptyIngredientBucket implements IngredientFailure {
  const _EmptyIngredientBucket();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyIngredientBucket);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IngredientFailure.emptyIngredientBucket()';
}


}




/// @nodoc


class _IngredientDatabaseFailure implements IngredientFailure {
  const _IngredientDatabaseFailure({required this.message});
  

 final  String message;

/// Create a copy of IngredientFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientDatabaseFailureCopyWith<_IngredientDatabaseFailure> get copyWith => __$IngredientDatabaseFailureCopyWithImpl<_IngredientDatabaseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientDatabaseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'IngredientFailure.databaseFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$IngredientDatabaseFailureCopyWith<$Res> implements $IngredientFailureCopyWith<$Res> {
  factory _$IngredientDatabaseFailureCopyWith(_IngredientDatabaseFailure value, $Res Function(_IngredientDatabaseFailure) _then) = __$IngredientDatabaseFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$IngredientDatabaseFailureCopyWithImpl<$Res>
    implements _$IngredientDatabaseFailureCopyWith<$Res> {
  __$IngredientDatabaseFailureCopyWithImpl(this._self, this._then);

  final _IngredientDatabaseFailure _self;
  final $Res Function(_IngredientDatabaseFailure) _then;

/// Create a copy of IngredientFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_IngredientDatabaseFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DietLogFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DietLogFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietLogFailure()';
}


}

/// @nodoc
class $DietLogFailureCopyWith<$Res>  {
$DietLogFailureCopyWith(DietLogFailure _, $Res Function(DietLogFailure) __);
}


/// Adds pattern-matching-related methods to [DietLogFailure].
extension DietLogFailurePatterns on DietLogFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NoLogsToday value)?  noLogsToday,TResult Function( _noLogsEver value)?  noLogsEver,TResult Function( _DietLogDatabaseFailure value)?  databaseFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoLogsToday() when noLogsToday != null:
return noLogsToday(_that);case _noLogsEver() when noLogsEver != null:
return noLogsEver(_that);case _DietLogDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NoLogsToday value)  noLogsToday,required TResult Function( _noLogsEver value)  noLogsEver,required TResult Function( _DietLogDatabaseFailure value)  databaseFailure,}){
final _that = this;
switch (_that) {
case _NoLogsToday():
return noLogsToday(_that);case _noLogsEver():
return noLogsEver(_that);case _DietLogDatabaseFailure():
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NoLogsToday value)?  noLogsToday,TResult? Function( _noLogsEver value)?  noLogsEver,TResult? Function( _DietLogDatabaseFailure value)?  databaseFailure,}){
final _that = this;
switch (_that) {
case _NoLogsToday() when noLogsToday != null:
return noLogsToday(_that);case _noLogsEver() when noLogsEver != null:
return noLogsEver(_that);case _DietLogDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noLogsToday,TResult Function()?  noLogsEver,TResult Function( String message)?  databaseFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoLogsToday() when noLogsToday != null:
return noLogsToday();case _noLogsEver() when noLogsEver != null:
return noLogsEver();case _DietLogDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noLogsToday,required TResult Function()  noLogsEver,required TResult Function( String message)  databaseFailure,}) {final _that = this;
switch (_that) {
case _NoLogsToday():
return noLogsToday();case _noLogsEver():
return noLogsEver();case _DietLogDatabaseFailure():
return databaseFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noLogsToday,TResult? Function()?  noLogsEver,TResult? Function( String message)?  databaseFailure,}) {final _that = this;
switch (_that) {
case _NoLogsToday() when noLogsToday != null:
return noLogsToday();case _noLogsEver() when noLogsEver != null:
return noLogsEver();case _DietLogDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NoLogsToday implements DietLogFailure {
  const _NoLogsToday();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoLogsToday);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietLogFailure.noLogsToday()';
}


}




/// @nodoc


class _noLogsEver implements DietLogFailure {
  const _noLogsEver();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _noLogsEver);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DietLogFailure.noLogsEver()';
}


}




/// @nodoc


class _DietLogDatabaseFailure implements DietLogFailure {
  const _DietLogDatabaseFailure({required this.message});
  

 final  String message;

/// Create a copy of DietLogFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DietLogDatabaseFailureCopyWith<_DietLogDatabaseFailure> get copyWith => __$DietLogDatabaseFailureCopyWithImpl<_DietLogDatabaseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DietLogDatabaseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DietLogFailure.databaseFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$DietLogDatabaseFailureCopyWith<$Res> implements $DietLogFailureCopyWith<$Res> {
  factory _$DietLogDatabaseFailureCopyWith(_DietLogDatabaseFailure value, $Res Function(_DietLogDatabaseFailure) _then) = __$DietLogDatabaseFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$DietLogDatabaseFailureCopyWithImpl<$Res>
    implements _$DietLogDatabaseFailureCopyWith<$Res> {
  __$DietLogDatabaseFailureCopyWithImpl(this._self, this._then);

  final _DietLogDatabaseFailure _self;
  final $Res Function(_DietLogDatabaseFailure) _then;

/// Create a copy of DietLogFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_DietLogDatabaseFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ExerciseFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseFailure()';
}


}

/// @nodoc
class $ExerciseFailureCopyWith<$Res>  {
$ExerciseFailureCopyWith(ExerciseFailure _, $Res Function(ExerciseFailure) __);
}


/// Adds pattern-matching-related methods to [ExerciseFailure].
extension ExerciseFailurePatterns on ExerciseFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EOffline value)?  eOffline,TResult Function( _EmptyExercises value)?  emptyExercises,TResult Function( _ExerciseNotFound value)?  exerciseNotFound,TResult Function( _ExerciseServerFailure value)?  serverFailure,TResult Function( _ExerciseDatabaseFailure value)?  databaseFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EOffline() when eOffline != null:
return eOffline(_that);case _EmptyExercises() when emptyExercises != null:
return emptyExercises(_that);case _ExerciseNotFound() when exerciseNotFound != null:
return exerciseNotFound(_that);case _ExerciseServerFailure() when serverFailure != null:
return serverFailure(_that);case _ExerciseDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EOffline value)  eOffline,required TResult Function( _EmptyExercises value)  emptyExercises,required TResult Function( _ExerciseNotFound value)  exerciseNotFound,required TResult Function( _ExerciseServerFailure value)  serverFailure,required TResult Function( _ExerciseDatabaseFailure value)  databaseFailure,}){
final _that = this;
switch (_that) {
case _EOffline():
return eOffline(_that);case _EmptyExercises():
return emptyExercises(_that);case _ExerciseNotFound():
return exerciseNotFound(_that);case _ExerciseServerFailure():
return serverFailure(_that);case _ExerciseDatabaseFailure():
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EOffline value)?  eOffline,TResult? Function( _EmptyExercises value)?  emptyExercises,TResult? Function( _ExerciseNotFound value)?  exerciseNotFound,TResult? Function( _ExerciseServerFailure value)?  serverFailure,TResult? Function( _ExerciseDatabaseFailure value)?  databaseFailure,}){
final _that = this;
switch (_that) {
case _EOffline() when eOffline != null:
return eOffline(_that);case _EmptyExercises() when emptyExercises != null:
return emptyExercises(_that);case _ExerciseNotFound() when exerciseNotFound != null:
return exerciseNotFound(_that);case _ExerciseServerFailure() when serverFailure != null:
return serverFailure(_that);case _ExerciseDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  eOffline,TResult Function()?  emptyExercises,TResult Function()?  exerciseNotFound,TResult Function( String message)?  serverFailure,TResult Function( String message)?  databaseFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EOffline() when eOffline != null:
return eOffline();case _EmptyExercises() when emptyExercises != null:
return emptyExercises();case _ExerciseNotFound() when exerciseNotFound != null:
return exerciseNotFound();case _ExerciseServerFailure() when serverFailure != null:
return serverFailure(_that.message);case _ExerciseDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  eOffline,required TResult Function()  emptyExercises,required TResult Function()  exerciseNotFound,required TResult Function( String message)  serverFailure,required TResult Function( String message)  databaseFailure,}) {final _that = this;
switch (_that) {
case _EOffline():
return eOffline();case _EmptyExercises():
return emptyExercises();case _ExerciseNotFound():
return exerciseNotFound();case _ExerciseServerFailure():
return serverFailure(_that.message);case _ExerciseDatabaseFailure():
return databaseFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  eOffline,TResult? Function()?  emptyExercises,TResult? Function()?  exerciseNotFound,TResult? Function( String message)?  serverFailure,TResult? Function( String message)?  databaseFailure,}) {final _that = this;
switch (_that) {
case _EOffline() when eOffline != null:
return eOffline();case _EmptyExercises() when emptyExercises != null:
return emptyExercises();case _ExerciseNotFound() when exerciseNotFound != null:
return exerciseNotFound();case _ExerciseServerFailure() when serverFailure != null:
return serverFailure(_that.message);case _ExerciseDatabaseFailure() when databaseFailure != null:
return databaseFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _EOffline implements ExerciseFailure {
  const _EOffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EOffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseFailure.eOffline()';
}


}




/// @nodoc


class _EmptyExercises implements ExerciseFailure {
  const _EmptyExercises();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyExercises);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseFailure.emptyExercises()';
}


}




/// @nodoc


class _ExerciseNotFound implements ExerciseFailure {
  const _ExerciseNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseFailure.exerciseNotFound()';
}


}




/// @nodoc


class _ExerciseServerFailure implements ExerciseFailure {
  const _ExerciseServerFailure({required this.message});
  

 final  String message;

/// Create a copy of ExerciseFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseServerFailureCopyWith<_ExerciseServerFailure> get copyWith => __$ExerciseServerFailureCopyWithImpl<_ExerciseServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExerciseFailure.serverFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ExerciseServerFailureCopyWith<$Res> implements $ExerciseFailureCopyWith<$Res> {
  factory _$ExerciseServerFailureCopyWith(_ExerciseServerFailure value, $Res Function(_ExerciseServerFailure) _then) = __$ExerciseServerFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ExerciseServerFailureCopyWithImpl<$Res>
    implements _$ExerciseServerFailureCopyWith<$Res> {
  __$ExerciseServerFailureCopyWithImpl(this._self, this._then);

  final _ExerciseServerFailure _self;
  final $Res Function(_ExerciseServerFailure) _then;

/// Create a copy of ExerciseFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ExerciseServerFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ExerciseDatabaseFailure implements ExerciseFailure {
  const _ExerciseDatabaseFailure({required this.message});
  

 final  String message;

/// Create a copy of ExerciseFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseDatabaseFailureCopyWith<_ExerciseDatabaseFailure> get copyWith => __$ExerciseDatabaseFailureCopyWithImpl<_ExerciseDatabaseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseDatabaseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExerciseFailure.databaseFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ExerciseDatabaseFailureCopyWith<$Res> implements $ExerciseFailureCopyWith<$Res> {
  factory _$ExerciseDatabaseFailureCopyWith(_ExerciseDatabaseFailure value, $Res Function(_ExerciseDatabaseFailure) _then) = __$ExerciseDatabaseFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ExerciseDatabaseFailureCopyWithImpl<$Res>
    implements _$ExerciseDatabaseFailureCopyWith<$Res> {
  __$ExerciseDatabaseFailureCopyWithImpl(this._self, this._then);

  final _ExerciseDatabaseFailure _self;
  final $Res Function(_ExerciseDatabaseFailure) _then;

/// Create a copy of ExerciseFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ExerciseDatabaseFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PremadeFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremadeFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PremadeFailure()';
}


}

/// @nodoc
class $PremadeFailureCopyWith<$Res>  {
$PremadeFailureCopyWith(PremadeFailure _, $Res Function(PremadeFailure) __);
}


/// Adds pattern-matching-related methods to [PremadeFailure].
extension PremadeFailurePatterns on PremadeFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _POffline value)?  pOffline,TResult Function( _EmptyPremade value)?  emptyPremade,TResult Function( _FetchFailed value)?  fetchFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _POffline() when pOffline != null:
return pOffline(_that);case _EmptyPremade() when emptyPremade != null:
return emptyPremade(_that);case _FetchFailed() when fetchFailed != null:
return fetchFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _POffline value)  pOffline,required TResult Function( _EmptyPremade value)  emptyPremade,required TResult Function( _FetchFailed value)  fetchFailed,}){
final _that = this;
switch (_that) {
case _POffline():
return pOffline(_that);case _EmptyPremade():
return emptyPremade(_that);case _FetchFailed():
return fetchFailed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _POffline value)?  pOffline,TResult? Function( _EmptyPremade value)?  emptyPremade,TResult? Function( _FetchFailed value)?  fetchFailed,}){
final _that = this;
switch (_that) {
case _POffline() when pOffline != null:
return pOffline(_that);case _EmptyPremade() when emptyPremade != null:
return emptyPremade(_that);case _FetchFailed() when fetchFailed != null:
return fetchFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pOffline,TResult Function()?  emptyPremade,TResult Function()?  fetchFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _POffline() when pOffline != null:
return pOffline();case _EmptyPremade() when emptyPremade != null:
return emptyPremade();case _FetchFailed() when fetchFailed != null:
return fetchFailed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pOffline,required TResult Function()  emptyPremade,required TResult Function()  fetchFailed,}) {final _that = this;
switch (_that) {
case _POffline():
return pOffline();case _EmptyPremade():
return emptyPremade();case _FetchFailed():
return fetchFailed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pOffline,TResult? Function()?  emptyPremade,TResult? Function()?  fetchFailed,}) {final _that = this;
switch (_that) {
case _POffline() when pOffline != null:
return pOffline();case _EmptyPremade() when emptyPremade != null:
return emptyPremade();case _FetchFailed() when fetchFailed != null:
return fetchFailed();case _:
  return null;

}
}

}

/// @nodoc


class _POffline implements PremadeFailure {
  const _POffline();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _POffline);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PremadeFailure.pOffline()';
}


}




/// @nodoc


class _EmptyPremade implements PremadeFailure {
  const _EmptyPremade();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyPremade);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PremadeFailure.emptyPremade()';
}


}




/// @nodoc


class _FetchFailed implements PremadeFailure {
  const _FetchFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PremadeFailure.fetchFailed()';
}


}




// dart format on
