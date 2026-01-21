import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_track/core/connectivity/bloc/connectivity_bloc.dart';
import 'package:crypto_track/core/connectivity/bloc/connectivity_state.dart';
import 'package:crypto_track/features/currency/bloc/currency_bloc.dart';
import 'package:crypto_track/features/currency/models/currency_type.dart';
import 'package:crypto_track/features/home/bloc/home_state.dart';
import 'package:crypto_track/features/home/repo/coins_list_repo.dart';
import 'package:flutter/material.dart';

import '../models/coin_data_model.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CurrencyBloc currencyBloc;
  late final StreamSubscription currencySub;
  final ConnectivityBloc connectivityBloc;
  late final StreamSubscription connectivitySub;

  HomeBloc({required this.currencyBloc, required this.connectivityBloc}) : super(HomeState.initial()) {
    currencySub = currencyBloc.stream.listen((event) {
      add(HomeInitialEvent(currency: event.currency));
    });
    connectivitySub = connectivityBloc.stream.listen((event) {
    },);
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeFetchMoreEvent>(homeFetchMoreEvent);
    on<HomeRefreshEvent>(homeRefreshEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    final isDisconnected = connectivityBloc.state is ConnectivityDisconnected;
    if(isDisconnected) return;
    emit(HomeState.loading());
    try {
      List<CoinDataModel> coinsList = await CoinsRepo.getCoinsList(page: 1,currency: event.currency);
      emit(
        HomeState.loaded(
          coinsList: coinsList,
          page: 1,
          isLoadingMore: false,
          isReachedEnd: coinsList.isEmpty,
        ),
      );
    } catch (e) {
      emit(HomeState.error(message: e.toString()));
    }
  }

  FutureOr<void> homeFetchMoreEvent(
    HomeFetchMoreEvent event,
    Emitter<HomeState> emit,
  ) async {
    final isDisconnected = connectivityBloc.state is ConnectivityDisconnected;
    if(isDisconnected) return;
    final currentState = state;
    if (currentState is! HomeLoaded) return;
    if (currentState.isLoadingMore || currentState.isReachedEnd) return;
    emit(currentState.copyWith(isLoadingMore: true));
    final nextPage = currentState.page + 1;
    try {
      final currency = currencyBloc.state.currency;
      final newCoinsList = await CoinsRepo.getCoinsList(page: nextPage,currency: currency);
      emit(
        currentState.copyWith(
          coinsList: [...currentState.coinsList, ...newCoinsList],
          isLoadingMore: false,
          isReachedEnd: newCoinsList.isEmpty,
          page: nextPage,
        ),
      );
    } catch (_) {
      emit(currentState.copyWith(isLoadingMore: false));
    }
  }

  FutureOr<void> homeRefreshEvent(
    HomeRefreshEvent event,
    Emitter<HomeState> emit,
  ) async {
    final isDisconnected = connectivityBloc.state is ConnectivityDisconnected;
    if(isDisconnected) return;
    try {
      final currency = currencyBloc.state.currency;
      final List<CoinDataModel> coinsList = await CoinsRepo.getCoinsList(
        page: 1,
        currency: currency,
      );
      emit(
        HomeState.loaded(
          coinsList: coinsList,
          page: 1,
          isLoadingMore: false,
          isReachedEnd: coinsList.isEmpty,
        ),
      );
    } catch (e) {
      emit(HomeState.error(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    connectivitySub.cancel();
    currencySub.cancel();
    return super.close();
  }
}
