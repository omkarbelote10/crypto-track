import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_track/features/coin/bloc/coin_state.dart';
import 'package:crypto_track/features/coin/repo/coin_chart_data_repo.dart';
import 'package:crypto_track/features/coin/repo/coin_details_repo.dart';
import 'package:crypto_track/features/currency/bloc/currency_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

import '../../../core/connectivity/bloc/connectivity_bloc.dart';

part 'coin_event.dart';

class CoinBloc extends Bloc<CoinEvent, CoinDetailsState> {
  final ConnectivityBloc connectivityBloc;
  final CurrencyBloc currencyBloc;
  late final StreamSubscription currencySub;

  CoinBloc({ required this.connectivityBloc,required this.currencyBloc}) : super(CoinDetailsState.initial()) {
    currencySub = currencyBloc.stream.listen((event) {

    },);
    on<CoinInitialEvent>(coinInitialEvent);
  }

  Future<void> coinInitialEvent(
    CoinInitialEvent event,
    Emitter<CoinDetailsState> emit,
  ) async {
    await Future.wait([

        _loadDetails(event.coinId, emit),
        _loadChart(event.coinId, emit),
    ]);
  }

  Future<void> _loadDetails(String coinId, Emitter<CoinDetailsState> emit) async {
    emit(state.copyWith(isDetailsLoading: true,detailsError: null));
    try{
      final details = await CoinDetailsRepo.getCoinDetails(coinId: coinId);
      emit(state.copyWith(isDetailsLoading: false,coinDetail: details));
    } catch (e) {
      emit(state.copyWith(isDetailsLoading: false, detailsError: e.toString()));
    }
  }

  Future<void> _loadChart(String coinId, Emitter<CoinDetailsState> emit) async {
    emit(state.copyWith(isChartLoading: true, chartError: null));
    try{
      final listFlSpots = await CoinChartDataRepo.getFlSpots(coinId: coinId,currency: currencyBloc.state.currency);
      emit(state.copyWith(isChartLoading: false,listOfFlSpots: listFlSpots));
    } catch(e){
      emit(state.copyWith(isChartLoading: false,chartError: e.toString()));
    }
  }
  @override
  Future<void> close() {
    currencySub.cancel();
    return super.close();
  }

}
