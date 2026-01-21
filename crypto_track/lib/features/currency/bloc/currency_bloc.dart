import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/currency_type.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyState(currency: Currency.usd)) {
    on<CurrencyChangeEvent>(currencyChangeEvent);
  }

  FutureOr<void> currencyChangeEvent(
    CurrencyChangeEvent event,
    Emitter<CurrencyState> emit,
  ) {
    emit(CurrencyState(currency: state.currency == Currency.inr ? Currency.usd : Currency.inr));
  }
}
