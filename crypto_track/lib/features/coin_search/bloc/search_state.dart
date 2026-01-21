import 'package:crypto_track/features/coin_search/models/search_coin_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState{
  const factory SearchState.initial() = SearchInitial;
  const factory SearchState.notFound() = SearchNotFound;
  const factory SearchState.loading() = SearchLoading;
  const factory SearchState.loaded({
    required List<SearchCoinDataModel> coinsList,
}) = SearchLoaded;
  const factory SearchState.error() = SearchError;
}

