import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crypto_track/core/connectivity/bloc/connectivity_bloc.dart';
import 'package:crypto_track/core/connectivity/bloc/connectivity_state.dart';
import 'package:crypto_track/features/coin_search/bloc/search_event.dart';
import 'package:crypto_track/features/coin_search/bloc/search_state.dart';
import 'package:crypto_track/features/coin_search/repo/query_repo.dart';
import 'package:crypto_track/features/coin_search/repo/trending_repo.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ConnectivityBloc connectivityBloc;
  SearchBloc({required this.connectivityBloc}) : super(SearchState.initial()) {
    on<SearchStarted>(searchStarted);
    on<SearchQueryChanged>(
      searchQueryChanged,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  FutureOr<void> searchStarted(
    SearchStarted event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchState.loading());
    try {
      final coinsList = await TrendingRepo.getTrndingCoins();
      if(coinsList.isEmpty){
        emit(SearchState.notFound());
        return;
      }
      emit(SearchState.loaded(coinsList: coinsList));
    } catch (e) {
      emit(SearchState.error());
    }
  }

  FutureOr<void> searchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final isDisconnected = connectivityBloc.state is ConnectivityDisconnected;
    if(isDisconnected){
      return;
    }
    if(event.query.isEmpty){
      emit(SearchState.loading());
      try{
        final coinsList = await TrendingRepo.getTrndingCoins();
        if(coinsList.isEmpty){
          emit(SearchState.notFound());
          return;
        }
        emit(SearchState.loaded(coinsList: coinsList));
      }catch (e) {
        emit(SearchState.error());
      }
      return;
    }
    emit(SearchState.loading());
    try {
      final coinsList = await QueryRepo.getQueryCoins(query: event.query);
      if(coinsList.isEmpty){
        emit(SearchState.notFound());
        return;
      }
      emit(SearchState.loaded(coinsList: coinsList));
    } catch (e) {
      emit(SearchState.error());
    }
  }
}

EventTransformer<E> debounce<E>(Duration duration){
  return (events,mapper){
    return events.debounceTime(duration).switchMap(mapper);
  };
}
