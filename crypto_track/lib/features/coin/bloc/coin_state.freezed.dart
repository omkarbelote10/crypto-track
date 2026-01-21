// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoinDetailsState {

 bool get isDetailsLoading; bool get isChartLoading; CoinDetailsModel? get coinDetail; List<FlSpot>? get listOfFlSpots; String? get detailsError; String? get chartError;
/// Create a copy of CoinDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinDetailsStateCopyWith<CoinDetailsState> get copyWith => _$CoinDetailsStateCopyWithImpl<CoinDetailsState>(this as CoinDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinDetailsState&&(identical(other.isDetailsLoading, isDetailsLoading) || other.isDetailsLoading == isDetailsLoading)&&(identical(other.isChartLoading, isChartLoading) || other.isChartLoading == isChartLoading)&&(identical(other.coinDetail, coinDetail) || other.coinDetail == coinDetail)&&const DeepCollectionEquality().equals(other.listOfFlSpots, listOfFlSpots)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError)&&(identical(other.chartError, chartError) || other.chartError == chartError));
}


@override
int get hashCode => Object.hash(runtimeType,isDetailsLoading,isChartLoading,coinDetail,const DeepCollectionEquality().hash(listOfFlSpots),detailsError,chartError);

@override
String toString() {
  return 'CoinDetailsState(isDetailsLoading: $isDetailsLoading, isChartLoading: $isChartLoading, coinDetail: $coinDetail, listOfFlSpots: $listOfFlSpots, detailsError: $detailsError, chartError: $chartError)';
}


}

/// @nodoc
abstract mixin class $CoinDetailsStateCopyWith<$Res>  {
  factory $CoinDetailsStateCopyWith(CoinDetailsState value, $Res Function(CoinDetailsState) _then) = _$CoinDetailsStateCopyWithImpl;
@useResult
$Res call({
 bool isDetailsLoading, bool isChartLoading, CoinDetailsModel? coinDetail, List<FlSpot>? listOfFlSpots, String? detailsError, String? chartError
});




}
/// @nodoc
class _$CoinDetailsStateCopyWithImpl<$Res>
    implements $CoinDetailsStateCopyWith<$Res> {
  _$CoinDetailsStateCopyWithImpl(this._self, this._then);

  final CoinDetailsState _self;
  final $Res Function(CoinDetailsState) _then;

/// Create a copy of CoinDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDetailsLoading = null,Object? isChartLoading = null,Object? coinDetail = freezed,Object? listOfFlSpots = freezed,Object? detailsError = freezed,Object? chartError = freezed,}) {
  return _then(_self.copyWith(
isDetailsLoading: null == isDetailsLoading ? _self.isDetailsLoading : isDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,isChartLoading: null == isChartLoading ? _self.isChartLoading : isChartLoading // ignore: cast_nullable_to_non_nullable
as bool,coinDetail: freezed == coinDetail ? _self.coinDetail : coinDetail // ignore: cast_nullable_to_non_nullable
as CoinDetailsModel?,listOfFlSpots: freezed == listOfFlSpots ? _self.listOfFlSpots : listOfFlSpots // ignore: cast_nullable_to_non_nullable
as List<FlSpot>?,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as String?,chartError: freezed == chartError ? _self.chartError : chartError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinDetailsState].
extension CoinDetailsStatePatterns on CoinDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinDetailsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _CoinDetailsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _CoinDetailsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDetailsLoading,  bool isChartLoading,  CoinDetailsModel? coinDetail,  List<FlSpot>? listOfFlSpots,  String? detailsError,  String? chartError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinDetailsState() when $default != null:
return $default(_that.isDetailsLoading,_that.isChartLoading,_that.coinDetail,_that.listOfFlSpots,_that.detailsError,_that.chartError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDetailsLoading,  bool isChartLoading,  CoinDetailsModel? coinDetail,  List<FlSpot>? listOfFlSpots,  String? detailsError,  String? chartError)  $default,) {final _that = this;
switch (_that) {
case _CoinDetailsState():
return $default(_that.isDetailsLoading,_that.isChartLoading,_that.coinDetail,_that.listOfFlSpots,_that.detailsError,_that.chartError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDetailsLoading,  bool isChartLoading,  CoinDetailsModel? coinDetail,  List<FlSpot>? listOfFlSpots,  String? detailsError,  String? chartError)?  $default,) {final _that = this;
switch (_that) {
case _CoinDetailsState() when $default != null:
return $default(_that.isDetailsLoading,_that.isChartLoading,_that.coinDetail,_that.listOfFlSpots,_that.detailsError,_that.chartError);case _:
  return null;

}
}

}

/// @nodoc


class _CoinDetailsState implements CoinDetailsState {
  const _CoinDetailsState({this.isDetailsLoading = false, this.isChartLoading = false, this.coinDetail, final  List<FlSpot>? listOfFlSpots, this.detailsError, this.chartError}): _listOfFlSpots = listOfFlSpots;
  

@override@JsonKey() final  bool isDetailsLoading;
@override@JsonKey() final  bool isChartLoading;
@override final  CoinDetailsModel? coinDetail;
 final  List<FlSpot>? _listOfFlSpots;
@override List<FlSpot>? get listOfFlSpots {
  final value = _listOfFlSpots;
  if (value == null) return null;
  if (_listOfFlSpots is EqualUnmodifiableListView) return _listOfFlSpots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? detailsError;
@override final  String? chartError;

/// Create a copy of CoinDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinDetailsStateCopyWith<_CoinDetailsState> get copyWith => __$CoinDetailsStateCopyWithImpl<_CoinDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinDetailsState&&(identical(other.isDetailsLoading, isDetailsLoading) || other.isDetailsLoading == isDetailsLoading)&&(identical(other.isChartLoading, isChartLoading) || other.isChartLoading == isChartLoading)&&(identical(other.coinDetail, coinDetail) || other.coinDetail == coinDetail)&&const DeepCollectionEquality().equals(other._listOfFlSpots, _listOfFlSpots)&&(identical(other.detailsError, detailsError) || other.detailsError == detailsError)&&(identical(other.chartError, chartError) || other.chartError == chartError));
}


@override
int get hashCode => Object.hash(runtimeType,isDetailsLoading,isChartLoading,coinDetail,const DeepCollectionEquality().hash(_listOfFlSpots),detailsError,chartError);

@override
String toString() {
  return 'CoinDetailsState(isDetailsLoading: $isDetailsLoading, isChartLoading: $isChartLoading, coinDetail: $coinDetail, listOfFlSpots: $listOfFlSpots, detailsError: $detailsError, chartError: $chartError)';
}


}

/// @nodoc
abstract mixin class _$CoinDetailsStateCopyWith<$Res> implements $CoinDetailsStateCopyWith<$Res> {
  factory _$CoinDetailsStateCopyWith(_CoinDetailsState value, $Res Function(_CoinDetailsState) _then) = __$CoinDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isDetailsLoading, bool isChartLoading, CoinDetailsModel? coinDetail, List<FlSpot>? listOfFlSpots, String? detailsError, String? chartError
});




}
/// @nodoc
class __$CoinDetailsStateCopyWithImpl<$Res>
    implements _$CoinDetailsStateCopyWith<$Res> {
  __$CoinDetailsStateCopyWithImpl(this._self, this._then);

  final _CoinDetailsState _self;
  final $Res Function(_CoinDetailsState) _then;

/// Create a copy of CoinDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDetailsLoading = null,Object? isChartLoading = null,Object? coinDetail = freezed,Object? listOfFlSpots = freezed,Object? detailsError = freezed,Object? chartError = freezed,}) {
  return _then(_CoinDetailsState(
isDetailsLoading: null == isDetailsLoading ? _self.isDetailsLoading : isDetailsLoading // ignore: cast_nullable_to_non_nullable
as bool,isChartLoading: null == isChartLoading ? _self.isChartLoading : isChartLoading // ignore: cast_nullable_to_non_nullable
as bool,coinDetail: freezed == coinDetail ? _self.coinDetail : coinDetail // ignore: cast_nullable_to_non_nullable
as CoinDetailsModel?,listOfFlSpots: freezed == listOfFlSpots ? _self._listOfFlSpots : listOfFlSpots // ignore: cast_nullable_to_non_nullable
as List<FlSpot>?,detailsError: freezed == detailsError ? _self.detailsError : detailsError // ignore: cast_nullable_to_non_nullable
as String?,chartError: freezed == chartError ? _self.chartError : chartError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
