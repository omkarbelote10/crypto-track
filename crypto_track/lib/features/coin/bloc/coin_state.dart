import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/coin_details_model.dart';
part 'coin_state.freezed.dart';

@freezed
abstract class CoinDetailsState with _$CoinDetailsState{
  const factory CoinDetailsState({
    @Default(false) bool isDetailsLoading,
    @Default(false) bool isChartLoading,

    CoinDetailsModel? coinDetail,
    List<FlSpot>? listOfFlSpots,

    String? detailsError,
    String? chartError,

}) = _CoinDetailsState;

  factory CoinDetailsState.initial() => const CoinDetailsState(
    isDetailsLoading: true,
    isChartLoading: true,
  );
}




