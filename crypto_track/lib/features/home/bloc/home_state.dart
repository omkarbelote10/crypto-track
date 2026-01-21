
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:crypto_track/features/home/models/coin_data_model.dart';
part 'home_state.freezed.dart';


@freezed
class HomeState with _$HomeState{
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.loaded({
    required List<CoinDataModel> coinsList,
    required int page,
    required bool isLoadingMore,
    required bool isReachedEnd,
}) = HomeLoaded;
  const factory HomeState.error({
    String? message,
}) = HomeError;
}